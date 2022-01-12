import concurrent.futures
import socket
import telemetry
import time
import PTLib
import timing

timing.setRefTime(0,0,0)

systemName = 'FV'

PTs = PTLib.PTs_init("PTs_Config_FV.ini")

server={'IP':'172.20.10.3','port':7234}

FV_readings = telemetry.Readings(PTs,[],[])

#PTLib.refreshPTs(PTs,2)

with concurrent.futures.ThreadPoolExecutor() as executor:
    executor.submit(PTLib.refreshPTs,PTs,20) #PT interogation thread
    executor.submit(telemetry.client_coms,server,20,FV_readings)

