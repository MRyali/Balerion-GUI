import os
import glob
import time
import subprocess

# Initialize 1-wire protocol drivers
#os.system('modprobe w1-gpio')
#os.system('modprobe w1-therm')
os.system('kextload w1-gpio') #mac os alternative
os.system('kextload w1-therm')

def __tempIDFilePath(sensor_index: int()):
    sensor_master_directory = '/sys/bus/w1/devices/w1_bus_master1/'
    sensor_folder = glob.glob(sensor_master_directory + '3b*')[sensor_index]
    sensor_name_file = sensor_folder + '/name'
    sensor_slave_file = sensor_folder + '/w1_slave'
    return sensor_name_file, sensor_slave_file


def __getSensorID(sensor_index: int()):
    name_file_open = open(__tempIDFilePath(sensor_index)[0], 'r')
    name_file_read = name_file_open.readlines()
    name_file_open.close()
    sensor_ID = name_file_read[0].strip()[3:]
    return sensor_ID


def __rawTemperature(sensor_index: int()):
    slave_file_open = open(__tempIDFilePath(sensor_index)[1], 'r')
    slave_file_read = slave_file_open.readlines()
    slave_file_open.close()
    return slave_file_read


def __getTemperature(sensor_index: int()):
    slave_file_contents = __rawTemperature(sensor_index)

    # Checks if slave file content contains 'YES" to confirm sensor is functioning properly.
    while slave_file_contents[0].strip()[-3:] != 'YES':
        print("Error reading temperature, re-attempt in 2 seconds.")
        time.sleep(2)
        slave_file_contents = __rawTemperature(sensor_index)

    # Returns index of where 't=' beings in contents of slave file.
    temperature_index = slave_file_contents[1].find('t=')

    # Checks if 't=' exists in slave file contents before computing and retunring temperature reading.
    if temperature_index != -1:
            
        raw_temperature = slave_file_contents[1].strip()[temperature_index + 2:]
        return raw_temperature

    # Warning if unable to retrieve temperature data.
    else:
        print("Unable to get temperature reading at" + str(sensor_index) + ".")


def convertTime(convert_time: int()):
    sensor_master_directory = '/sys/bus/w1/devices/w1_bus_master1/'
    sensor_folder = glob.glob(sensor_master_directory + '3b*')

    for sensor in range(0, len(sensor_folder)):
        convert_time_file = sensor_folder[sensor] + '/conv_time'
        echo_command = "echo {} > {}".format(convert_time, convert_time_file)
        subprocess.Popen(['sudo', 'sh', '-c', echo_command])


def PropagateTCs():
    user_start_loop = True

    while user_start_loop:

        user_start = input("Ready to begin TC-Port-to-ID propagation? (y, n): ")

        if user_start == 'y':
            sensor_master_directory = '/sys/bus/w1/devices/w1_bus_master1/'
            sensor_folder_list = glob.glob(sensor_master_directory + '3b*')

            file_name = 'TC_Port_ID.ini'
            with open(file_name, 'a+') as sensors_list:
                
                amount_of_sensors = len(sensor_folder_list)
                sensors_propagated = 1
                propagation_loop = True

                while propagation_loop:

                    for probes in range(0, amount_of_sensors):
                        sensor_check = __getTemperature(probes)
                        
                        if sensor_check != '-187':
                            sensor_ID = __getSensorID(probes)

                            user_port_loop = True

                            while user_port_loop:

                                user_port_input = input("\nOnly enter port number for current TC board in format TXX.\n"\
                                    + "Example, port 1 = T1, port 10 = T10.\nT")
                                
                                if user_port_input.isnumeric() == False:
                                    print("\nInvalid input, must be an integar value.")

                                else:
                                    user_port_loop = False

                            sensors_list.write("[T{}]\nid = {}\n\n".format(user_port_input, sensor_ID))
                            print("[T{}] | id = {}\n".format(user_port_input, sensor_ID))
                            sensors_propagated = sensors_propagated + 1

                        elif sensor_check == '-187':
                            continue
                    
                        user_continue_loop = True

                        if sensors_propagated == 11:
                            propagation_loop = False
                            user_continue_loop = False

                        while user_continue_loop:

                            user_continue = input("Change Thermocouple IC and input 'c' to continue, or 'q' to quit: ")

                            if user_continue == 'c':
                                user_continue_loop = False

                            elif user_continue == 'q':
                                user_continue_loop = False
                                propagation_loop = False

                                quit_loop = True

                                while quit_loop:

                                    user_quit = input("\nDo you want to delete TC_Port_ID.ini contents? (y, n): ")

                                    if user_quit == 'y':
                                        quit_loop = False
                                        sensors_list.truncate(0)
                                        sensors_list.close()

                                    elif user_quit == 'n':
                                        quit_loop = False
                                        sensors_list.close()

                                    else:
                                        print("\nInvalid input, must choose y = yes, or n = no.\n")

                            else:
                                print("\nInvalid input, choose 'c' to continue, or 'q' to quit.\n")

                print("\nPropagation complete.")
                user_start_loop = False
                sensors_list.close()

        elif user_start == 'n':
            print("\nQuitting TC propagation")
            user_start_loop = False
        
        else:
            print("\nInvalid input, must choose y = yes, or n = no.\n")


convertTime(15)

PropagateTCs()
