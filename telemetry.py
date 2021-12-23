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

    def push(self,name:str,value:str,time:str):
        new_reading = dict()
        new_reading['value']= value
        new_reading['time']= time
        new_reading['type']= name[0:2]
        self.readings[name] = new_reading




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

def client_IO(server_socket:socket.socket,frequency:float,client_readings:Readings):

    timeout = 0.01 #seconds
    period = 1/frequency - timeout

    print("Starting data stream...")
    while True:
        client_readings.refrechAll()
        try:
            # attempt reading/writing
            for reading_name in client_readings.readings:
                sendReading(reading_name,client_readings.readings[reading_name],server_socket)
                """
                readable = select.select([socket], [], [], timeout)
                if readable[0]:
                    read(socket)
                """
                time.sleep(period)
        except:
            # if exception rises close connection and try to reconnect
            socket.close
            print('Client lost connection to server')
            break



def client_coms(server: dict, frequency:float, client_readings: Readings):
    while True:
        try:
            # Attempt connecting to server
            print("Looking for server")
            socket = connectToSever(server['IP'], server['port'])
            print("Connection established with server. IP:{}    port:{}".format(server['IP'],server['port']))

            # if connection is successful start sending data 
            client_IO(socket,frequency,client_readings)

        except:
            # if unable to connect wait 5 sec then try again
            print("Could not connect")
            time.sleep(5)
        
        
def server_coms(readings:Readings):
    FV_server = openSocket()
    while True:
        try:
            print("Awaiting connection")
            FV_client = connectToClient(FV_server)
            server_IO(FV_client,readings)
        except:
            print("Connection error occured. Restart required.")
            break


def openSocket():
    # Reserves a socket on the server machine
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    server_ip = '172.20.10.2' #socket.gethostname()
    port = 5234
    s.bind((server_ip,port))

    print(f"Server Online. IP adress: {server_ip} Port {port}")
    
    return s

def connectToClient(serverSocket):
    # looks for any client trying to connect to the server
    serverSocket.listen(1)
    clientsocket, address = serverSocket.accept()
    print(f"Connection from {address} has been established.")

    return clientsocket

def server_IO(socket,readings:Readings):
    print('Awaiting data')
    while True:
        try:
            receiveData(socket,readings)
        except:
            break

def receiveData(socket,readings:Readings):

    msg = socket.recv(1024)

    if msg:
        print(msg.decode("utf-8"))
        msg = msg.decode("utf-8")
        data = msg.split("#")
        while data:
            if len(data) == 24:
                received_reading = data[0].split("/")

                name = received_reading[0]
                value = received_reading[1]
                time = received_reading[2]

                readings.push(name,value,time)
            data.remove[data[0]]
                
    else:
        socket.close
        print("Connection Lost")
        raise Exception("Connection Lost")