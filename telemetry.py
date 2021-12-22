import socket
import select
import time

class Readings:

    def __init__(self,PT_dict:dict,TC_dict:dict,SV_dict:dict):
        self.PTs = PT_dict
        self.TCs = TC_dict
        self.SVs = SV_dict
        self.readings = dict()

        for PT_name in self.PTs:
            new_reading = dict()
            new_reading['value']= "{:0>7.2f}".format(self.PTs[PT_name].pressure)
            new_reading['time']= self.PTs[PT_name].timeStamp
            new_reading['type']= 'PT'
            self.readings[PT_name] = new_reading
        
    def refrechAll(self):
        for PT_name in self.PTs:
            new_reading = dict()
            new_reading['value']= "{:0>7.2f}".format(self.PTs[PT_name].pressure)
            new_reading['time']= self.PTs[PT_name].timeStamp
            new_reading['type']= 'PT'
            self.readings[PT_name] = new_reading


def connectToSever(server_ip, port):
    # called by client to connect to server
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((server_ip, port))
    s.setblocking(0)
    return s

#def server_coms(socket):

def sendReading(name:str, reading:dict, socket: socket.socket):
    value = reading['value']
    time =  reading['time']
    msg = "#" + name + "/" + value + "/" + time 
    print(msg)
    msg = str.encode(msg)
    socket.sendall(msg)

def client_coms(socket: socket.socket, frequency:float, client_readings: Readings):
    timeout = 0.01 #seconds
    period = 1/frequency - timeout
    while True:
        client_readings.refrechAll()
        for reading_name in client_readings.readings:
            sendReading(reading_name,client_readings.readings[reading_name],socket)
            """
            readable = select.select([socket], [], [], timeout)
            if readable[0]:
                read(socket)
            """
            time.sleep(period)
