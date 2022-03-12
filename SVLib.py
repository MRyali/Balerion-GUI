import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

class Valve():

    def __init__(self,pin:int):
        self.pin = pin
        self.isOpen = False
        GPIO.setup(pin, GPIO.OUT)

    def openValve(self):
        self.isOpen = True
        GPIO.output(self.pin, GPIO.HIGH)

    def closeValve(self):
        self.isOpen = False
        GPIO.output(self.pin, GPIO.LOW)


def initialiseValves():
    valves = dict()
    valves['SVH001'] = Valve(17)
    return valves