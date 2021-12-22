import concurrent.futures
import socket
import telemetry
import time
import PTLib
import timing

timing.setRefTime(0,0,0)

systemName = 'FV'

PTs = PTLib.PTs_init("PTs_config_FV")

serverSocket = telemetry.connectToSever('172.20.10.2',5234)

FV_readings = telemetry.Readings(PTs,[],[])

with concurrent.futures.ThreadPoolExecutor() as executor:
    executor.map(PTLib.refreshPTs,PTs,2) #PT interogation thread
    executor.map(telemetry.client_coms,serverSocket,2,FV_readings)

