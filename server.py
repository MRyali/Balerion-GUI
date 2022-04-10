import telemetry
import concurrent.futures
import threading
import gui
from PySide6.QtCore import QThread

 
readings = telemetry.Readings({},{},{})


readings.push("PTF201","450.00","0000")

reading = readings.readings["PTF201"]

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


