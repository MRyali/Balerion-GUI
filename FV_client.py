import concurrent.futures
import socket
import telemetry
import time
import PTLib
import timing
import TCLib
import SVLib

timing.setRefTime(0,0,0)

systemName = 'FV'

PTs = PTLib.PTs_init("PTs_Config_FV.ini")
TCs = TCLib.TC_Initialization('TC_Config_FV.ini')
SVs = SVLib.initialiseValves()

telemetry.parseFile("ipconfig.txt")

server={'IP':telemetry.getIP,'port':7234}

FV_readings = telemetry.Readings(PTs,TCs,SVs)

#PTLib.refreshPTs(PTs,2)

with concurrent.futures.ThreadPoolExecutor() as executor:
    executor.submit(PTLib.refreshPTs,PTs,50) #PT interogation thread
    executor.submit(TCLib.refreshTCs,TCs)
    executor.submit(telemetry.client_coms,server,50,FV_readings)

