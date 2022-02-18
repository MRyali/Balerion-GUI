import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)

class Valve():

    def __init__(self,pin:int):
        self.pin = pin
        GPIO.setup(pin, GPIO.OUT)

    def openValve(self):
        GPIO.output(pin, GPIO.HIGH)

    def closeValve(self):
        GPIO.output(pin, GPIO.LOW)

testValve = Valve(17)
