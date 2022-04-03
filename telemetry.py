import socket
import select
import time

import timing

armedValves: dict = {}
sourceFile = open("data_logs/Apr 3_" + str(timing.missionTime()) +'_log.txt', 'w')
class Readings:

    def __init__(self,PT_dict:dict,TC_dict:dict,SV_dict:dict):
        self.PTs = PT_dict
        self.TCs = TC_dict
        self.SVs = SV_dict
        self.readings = dict()
        self.refrechAll()
        
    def refrechAll(self):
        for PT_name in self.PTs:
            new_reading = dict()
            new_reading['value']= "{:0>7.2f}".format(self.PTs[PT_name].pressure)
            new_reading['time']= self.PTs[PT_name].timeStamp
            new_reading['type']= 'PT'
            self.readings[PT_name] = new_reading



        for TC_name in self.TCs:
            new_reading = dict()
            temp = self.TCs[TC_name].temperature.get('f')
            new_reading['value']= "{:0>7.2f}".format(temp)
            new_reading['time']= self.TCs[TC_name].timeStamp
            new_reading['type']= 'TC'
            self.readings[TC_name] = new_reading

    def push(self,name:str,value:str,time:str):
        
        new_reading = dict()
        new_reading['value']= value
        new_reading['time']= time
        new_reading['type']= name[0:2]
        self.readings[name] = new_reading

    def execute(self,name:str,value:str,time:str):
        print("getting command " + name)
        if value == 'OPEN_':
            print("getting command 111111")
            self.SVs[name].openValve()
            
            self.push(name,'OPENED_',time)
        elif value == 'CLOSE':
            
            self.SVs[name].closeValve()
            
            self.push(name,'CLOSED_',time)




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
    readingType = reading['type']
    
    msg = "#" + name + "/" + value + "/" + time
    
    if readingType == 'SV':
        print(msg)
     
    #if name == 'TCH001':
        #print(msg)
    msg = str.encode(msg)
    socket.sendall(msg)


def getCommand(serverSocket:socket,FV_Reandings:Readings):
    print("getting command")
    
    msg = serverSocket.recv(1024)
    msg = msg.decode("utf-8")

    data = msg.split("#")
    #print("msg = ",msg)

    
    while data:
        #print("data= ",data[0])
        if len(data[0]) == 22:
            
            received_reading = data[0].split("/")

            name = received_reading[0]
            value = received_reading[1]
            time = received_reading[2]
            
            FV_Reandings.execute(name,value,time)

            print(received_reading)
            
            

        data.remove(data[0])
    



def client_IO(server_socket:socket.socket,frequency:float,client_readings:Readings):

    timeout = 0.01 #seconds
    period = 1/frequency

    print("Starting data stream...")
    while True:
        client_readings.refrechAll()
        try:
            # attempt reading/writing
            for reading_name in client_readings.readings:
                sendReading(reading_name,client_readings.readings[reading_name],server_socket)
                #print('got here')
                time.sleep(period)
                
        except:
            # if exception rises close connection and try to reconnect
            socket.close
            print('Client lost connection to server')
            break
        
        readable = select.select([server_socket], [], [], timeout)
        if readable[0]:
            #print('got something')
            getCommand(server_socket,client_readings)


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
    
    # server_ip = '172.20.10.3' #socket.gethostname()
    parseFile("ipconfig.txt")
    server_ip = getIP()
    port = getPort()

    print(f"IP adress: '{server_ip}' Port {port}")
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
            sendCommand(socket)
        except:
            break

def receiveData(socket,readings:Readings):

    msg = socket.recv(1024)
    
    if msg:
        msg = msg.decode("utf-8")
    else:
        socket.close
        print("Connection Lost")
        raise Exception("Connection Lost")

    data = msg.split("#")
    #print("msg = ",msg)

    try:
        while data:
            
            if len(data[0]) == 24:
                #print("data= ",data[0])
                
                received_reading = data[0].split("/")

                name = received_reading[0]
                value = received_reading[1]
                time = received_reading[2]

                readings.push(name,value,time)

                #if name =='PTH001':
                #print ("Time: " + time)
                #logStamp = timing.getTimeDiffInSeconds(originTime, time)
                print (name + " " + value + " " + timing.missionTime(time) , file = sourceFile, flush = True)
                #print(data[0], file = sourceFile, flush=True)
                if(name=='TCH001'):
                    print(name + " " + value + " " + timing.getTimeDiffInSeconds(time), flush = True)
            

            data.remove(data[0])
    except:
        print('Data processing error occured')
            

commands:list = []

def appendCommand(inReadings:Readings):
    for valve in armedValves:
        if armedValves[valve]=='ARMED':
            
            
            reading = inReadings.readings[valve]
            state = reading['value']

            if state == "OPENED_":
                
                #inReadings.push(valve,"CLOSES","00000")
                msg = "#" + valve + "/" + "CLOSE" + "/" + timing.missionTime() 
                #inReadings.push(valve,"CLOSED",time)
                print("Set",valve,"to CLOSED")
            else:
                #inReadings.push(valve,"OPENED","00000")
                msg = "#" + valve + "/" + "OPEN_" + "/" + timing.missionTime()
                #print("Set",valve,"to OPENED")
                inReadings.push(valve,"OPENED",time)

            commands.append(msg)


def sendCommand(FV_Socket:socket):
    while commands:
        
        msg = commands.pop()
        msg = str.encode(msg)
        FV_Socket.sendall(msg)

        print(msg)

config = dict()

def parseFile(filepath):
    fd = open(filepath, "r")
    
    if fd == -1:
        print("Cannot open "+ filepath)
    count = 0
    while True:
        line = fd.readline()
        line = line.replace("\n", "")
        if len(line) == 0:
            break
        x = line.split("=", 2)
        # print("line: " + x[0] + ":" + x[1]) #debug
        if len(x) != 2:
            print("Error: line " + str(count) + " is invalid")
        else:
            config[x[0]]= x[1]
        count = count+1

    if len(config) == 0:
        print("Error: " + filepath + "contains no valid entries")

def getIP():
    if("IP" in config):
        return config.get("IP") 
    else:
        return "Error: IP not found in config"

def getPort():
    if("port" in config):
        return int(config.get("port"))
    else:
        print("Error: port not found in config")
        return -1
 
   

                
    