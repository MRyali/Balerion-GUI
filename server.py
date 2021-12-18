import socket

# create the socket
# AF_INET == ipv4
# SOCK_STREAM == TCP

def openSocket():
    # Reserves a socket on the machine for this program
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    server_ip = '172.20.10.2' #socket.gethostname()
    port = 5234
    s.bind((server_ip,port))

    print(f"Server Online. IP adress: {server_ip} Port {port}")
    
    return s


def connectToClient(socket):
    # looks for any client trying to connect to the server
    socket.listen(1)
    clientsocket, address = socket.accept()
    print(f"Connection from {address} has been established.")

    return clientsocket

def receiveData(socket):
    msg = socket.recv(1024)
    print(msg.decode("utf-8"))

def sendrcv(socket):
    while True:
        receiveData(socket)




def communicateFV():
    ServerFVSocket = openSocket()
    while True:
        try:
            FVSocket = connectToClient(ServerFVSocket)
            
            #FVSocket.send(bytes("Hey there!!!","utf-8"))
            sendrcv(FVSocket)
        except:
            print("Connection error occured. Restart required.")
            break
        
    
communicateFV()