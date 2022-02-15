import concurrent.futures
import socket
import telemetry
import time
import PTLib
import timing
import TCLib

timing.setRefTime(0,0,0)

systemName = 'FV'

PTs = PTLib.PTs_init("PTs_Config_FV.ini")
TCs = TCLib.TC_Initialization('TC_Config_FV.ini')

server={'IP':'172.20.10.3','port':7234}

FV_readings = telemetry.Readings(PTs,TCs,[])

#PTLib.refreshPTs(PTs,2)

with concurrent.futures.ThreadPoolExecutor() as executor:
    executor.submit(PTLib.refreshPTs,PTs,50) #PT interogation thread
    executor.submit(TCLib.refreshTCs,TCs)
    executor.submit(telemetry.client_coms,server,50,FV_readings)

