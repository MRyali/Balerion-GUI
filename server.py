import telemetry
import concurrent.futures
import threading
import gui
from PySide6.QtCore import QThread

 
readings = telemetry.Readings({},{},{}) #reads Value, Time, Type

#initializing some dummy sensor values
readings.push("PT-O1","1000.00","0000")
reading = readings.readings["PT-O1"]
readings.push("PT-O2","1000.00","0000")
reading = readings.readings["PT-O2"]
readings.push("PT-F5","2550.00","0000")
reading = readings.readings["PT-F5"]
readings.push("PT-X1","2000.00","0000")
reading = readings.readings["PT-X1"]
readings.push("PT-X2","2000.00","0000")
reading = readings.readings["PT-X2"]
readings.push("PT-F4","1000.00","0000")
reading = readings.readings["PT-F4"]
readings.push("PT-C3","1000.00","0000")
reading = readings.readings["PT-C3"]
readings.push("PT-C2","1000.00","0000")
reading = readings.readings["PT-C2"]
readings.push("PT-C1","1000.00","0000")
reading = readings.readings["PT-C1"]
readings.push("PT-F1","2130.00","0000")
reading = readings.readings["PT-F1"]
readings.push("PT-F2","2110.00","0000")
reading = readings.readings["PT-F2"]
readings.push("PT-F3","1980.00","0000")
reading = readings.readings["PT-F3"]

readings.push("TC-O1","-100.00","0000")
reading = readings.readings["TC-O1"]
readings.push("TC-F3","-50.00","0000")
reading = readings.readings["TC-F3"]
readings.push("TC-X1","-100.00","0000")
reading = readings.readings["TC-X1"]
readings.push("TC-F2","-50.00","0000")
reading = readings.readings["TC-F2"]
readings.push("TC-C1","2000.00","0000")
reading = readings.readings["TC-C1"]
readings.push("TC-C2","2508.00","0000")
reading = readings.readings["TC-C2"]
readings.push("TC-F1","-50.00","0000")
reading = readings.readings["TC-F1"]
readings.push("TC-X2","-100.00","0000")
reading = readings.readings["TC-X2"]




print(reading['value'])

class MyWorker(QThread):
    Myreads:telemetry.Readings
    def run(self):
        telemetry.server_coms(self.Myreads)

newWorker = MyWorker()
newWorker.Myreads = readings
newWorker.start()

# a test comment

# some crazy stuff 2

gui.guiThreadFunc(readings) 


