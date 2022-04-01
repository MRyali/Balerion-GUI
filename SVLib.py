
import serial 
import time

def set_up_serial(port):
    """
    SUM: Sets up UART communication with Arduino
    AUG1: port(string of device port location look in /dev/ for mac and linux. 
         It is tty.(random stuff) or Device manager for windows com(#))
    RETURN: serial object
    """
    ser = serial.Serial(port,baudrate=9600, parity=serial.PARITY_NONE, timeout=1, stopbits=serial.STOPBITS_ONE, bytesize=serial.EIGHTBITS)
    time.sleep(2)
    return ser


def send_data(ser, data_to_send):
    """
    SUM: sends data to the Arduino over UART
    AUG1: ser (serial object for device to send to) 
    AUG2: data_to_send (string of data to send)
    RETURN: None
    """
    send_data_list = list(data_to_send)
    for data_byte in send_data_list:
        ser.write(data_byte.encode('ascii'))
        
def receive_data(ser,byte=False):

    data = ''

    if byte == True:
        data = ser.read()
    else:
        data = ser.readline()

    return data

class Valve():

    def __init__(self, serial_port:serial.Serial(),pin:int):
        self.pin = pin
        self.isOpen = False
        self.serial_port = serial_port
        

    def openValve(self):
        self.isOpen = True
        send_data(self.serial_port,"#P10_LOW__\n")
        print("#P10_LOW__\n")

    def closeValve(self):
        self.isOpen = False
        send_data(self.serial_port,"#P10_HIGH_\n")
        print("#P10_HIGH_\n")


def initialiseValves():
    ser = set_up_serial('/dev/ttyACM0')
    valves = dict()
    valves['SVH001'] = Valve(ser,1)
    return valves