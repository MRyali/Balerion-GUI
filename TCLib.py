import os
import time
import glob
import timing
import subprocess
import time
from configparser import ConfigParser


# Initialize 1-wire protocol drivers
os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')


# Thermocouple class for reading temperatures and retriving IC ID value.
class TC():
    """Thermocouple readings over w1 communications protocol."""

    def __init__(self, id: str(), offset: float(), temp_units: str()):
        self.id = id
        self.offset = offset # Has to be fahrenheit input.
        self.temp_units = temp_units
        self.temperature: float()
        self.time_stamp: str()
        

    def __tempFilePath(self):
        """Returns string file path of slave file of chose sensor by index integer input."""
        sensor_master_directory = '/sys/bus/w1/devices/w1_bus_master1/'
        sensor_slave_file = sensor_master_directory + '3b-' + self.id + '/w1_slave'
        return sensor_slave_file
        
    def __rawTemperature(self):
        """Opens chosen sensor slave file, reads contents,
         and outputs list of contents given slave file path as string input."""
        slave_file_open = open(self.__tempFilePath(), 'r')
        slave_file_read = slave_file_open.readlines()
        slave_file_open.close()
        return slave_file_read

    def getTemperature(self):
        """Extracts raw temperature data from slave file, then computes temperature reading
        in celsius by default, fahrenheit and kelvin are optional, 
        given slave file path contents as string input."""
        slave_file_contents = self.__rawTemperature()

        # Checks if slave file content contains 'YES" to confirm sensor is functioning properly.
        while slave_file_contents[0].strip()[-3:] != 'YES':
            print("Error reading temperature, re-attempt in 2 seconds.")
            time.sleep(2)
            slave_file_contents = self.__rawTemperature()

        # Returns index of where 't=' beings in contents of slave file.
        temperature_index = slave_file_contents[1].find('t=')

        # Checks if 't=' exists in slave file contents before computing and retunring temperature reading.
        if temperature_index != -1:
            
            raw_temperature = slave_file_contents[1].strip()[temperature_index + 2:]
            self.time_stamp = timing.missionTime()
            fahrenheit_temperature = float(raw_temperature) / 1000.0 * (9.0 / 5.0) + 32.0 + self.offset
            celsius_temperature = (fahrenheit_temperature - 32.0) * (5.0 / 9.0)

            # Function returns celsius temperature by default.
            if self.temp_units == 'c':
                self.temperature = celsius_temperature
                return celsius_temperature

            # Function optionally returns fahrenheit temperature.
            elif self.temp_units == 'f':
                self.temperature = fahrenheit_temperature
                return fahrenheit_temperature

            # Function optionally returns kelven temperature.
            elif self.temp_units == 'k':
                kelvin_temperature = celsius_temperature + 273.15
                self.temperature = kelvin_temperature
                return kelvin_temperature

            # Warning for invalid input.
            else:
                print("getTemperature() invalid unit argument, default = 'c', optional = 'f' or 'k'.")

        # Warning if unable to retrieve temperature data.
        else:
            print("Unable to get temperature reading at" + str(self.sensor_index) + ".")

def __convertTemp(offset: float(), offset_units: str()):
    """Converts any unit into fahrenheit."""
    if offset_units == 'f':
        return offset

    elif offset_units == 'c':
        return offset * (9.0 / 5.0) + 32.0
        
    elif offset_units == 'k':
        return (offset - 273.15) * (9.0 / 5.0) + 32.0


# Calls data from TC_Config_FV.ini to associate TC index in sensor list generated by glob library
# to its prescribed name in P&ID. Outputs a key-list dictionary, key is the perscribed name
# and value is the TC Class and offset.
def TC_Initialization(config_File_Name: str()):
    TC_config = ConfigParser()
    TC_port_ID = ConfigParser()

    TC_config.read(config_File_Name)
    TC_port_ID.read('TC_Port_ID.ini')

    TC_init_dict = dict()

    print("Compiling TCs from configuration file")

    for TC_name in TC_config.sections():
        offset = float(TC_config[TC_name]['offset'])
        offset_units = TC_config[TC_name]['offset_units']
        temp_units = TC_config[TC_name]['temp_units']
        port = TC_config[TC_name]['port']
        ID = TC_port_ID[port]['id']

        offset = __convertTemp(offset, offset_units)
        print(offset)
        # TC_init_dict[TC_name] = TC(ID, offset, temp_units)
        TC_object = TC(ID, offset, temp_units)
        TC_init_dict[TC_name] = TC_object

        print("[{}] has been successfully intialized.".format(TC_name))

    return TC_init_dict


def convertTime(convert_time: int()):
    sensor_master_directory = '/sys/bus/w1/devices/w1_bus_master1/'
    sensor_folder = glob.glob(sensor_master_directory + '3b*')

    for sensor in range(0, len(sensor_folder)):
        convert_time_file = sensor_folder[sensor] + '/conv_time'
        echo_command = "echo {} > {}".format(convert_time, convert_time_file)
        subprocess.Popen(['sudo', 'sh', '-c', echo_command])


convertTime(15)


def refreshTCs(TC_dict: dict()):
    while True:
        for sensor in TC_dict:
            temp_reading = TC_dict[sensor].getTemperature()
            output = "[{}]: {:0>7.2f} F".format(sensor, temp_reading)
            print(output)

refreshTCs(TC_Initialization('TC_Config_FV.ini'))