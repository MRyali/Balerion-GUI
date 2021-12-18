import socket
import time

def connectToSever():
    # connect to server
    server_ip = socket.gethostname()
    port = 5234
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((server_ip, port))
    return s


t_init = time.time()

CR = connectToSever()
msg = CR.recv(1024)
print(msg.decode("utf-8"))

t = time.time()-t_init

tFV = "%5.0fs ellapsed" % t

CR.send(bytes(tFV,"utf-8"))

time.sleep(1)

t = time.time()-t_init

tFV = "%5.0fs ellapsed" % t

CR.send(bytes(tFV,"utf-8"))