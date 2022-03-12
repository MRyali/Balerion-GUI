import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

class Valve():

    def __init__(self,pin:int):
        self.pin = pin
        self.isOpen = False
        GPIO.setup(pin, GPIO.OUT)

    def openValve(self):
<<<<<<< HEAD
        GPIO.output(self.pin, GPIO.HIGH)

    def closeValve(self):
        print("getting command 222222")
=======
        self.isOpen = True
        GPIO.output(self.pin, GPIO.HIGH)

    def closeValve(self):
        self.isOpen = False
>>>>>>> newServerBranch
        GPIO.output(self.pin, GPIO.LOW)


def initialiseValves():
    valves = dict()
    valves['SVH001'] = Valve(17)
    return valves