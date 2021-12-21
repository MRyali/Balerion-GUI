import time
import socket
import spidev
from configparser import ConfigParser
import logging


class MCP3008:
    def __init__(self,SPI_init):
        self.SPI = SPI_init

    def __readMCP3008(self, channel):
        #gets the raw 10-bit value from the MCP3008 ADC

        #request value from MCP3008 for channel number 'channel'
        rawData = self.SPI.xfer([1, (8 + channel) << 4, 0])

        #convert the two 8-bit replies to a single 10-bit reading
        #processedData = 0...1023
        processedData = ((rawData[1]&3) << 8) + rawData[2]

        return processedData

    def __dig2volts(self,digitalReading: int):
        #converts digital value (0...1023) to voltage (0...5V)
        voltage = (digitalReading * 5.365) / 1023
        return voltage

    def interogate(self, channel):
        data = self.__readMCP3008(channel)
        voltage = self.__dig2volts(data)
        return (voltage, data)


#Defining the Pressure Tansducer Class
class PT:
    #physical values
    voltage: float = 0
    pressure: float = 0

    #linear fit variables
    offset = -0.8008008008
    slope = -offset/0.004

    def __init__(self, ADC_init: MCP3008, channel_init: int):  
        # the ADC chip the PT is connected to
        self.ADC = ADC_init
        # the channel on the PT is connected to on the ADC val=0...7
        self.channel = channel_init


    def __volts2PSI(self,voltage):
        p1 = abs(self.slope*voltage+self.offset)
        return p1

    def getPressure(self):
        self.voltage, _ = self.ADC.interogate(self.channel)
        self.pressure = self.__volts2PSI(self.voltage)
        return self.pressure

def openSPI(chip, frequency):
    #opens an SPI channel
    spi = spidev.SpiDev()
    spi.open(0,chip)
    spi.max_speed_hz = frequency
    return spi

#initialize SPI bus
SPI0 = openSPI(0, 1000)
SPI1 = openSPI(1, 1000)

#initialize ADCs
ADC0 = MCP3008(SPI0)
ADC1 = MCP3008(SPI1)

#Open PT config file
PTsCfg = ConfigParser()
PTsCfg.read('PTs_Config.ini')

#Creat a PT dictionary
PTs = dict()

#Generat PT Objects from the cfg file and store them in the PT dictionary
for PT_name in PTsCfg.sections():
    PT_port = PTsCfg[PT_name]['port']
    PT_channel = PT_port[1]

    if PT_port[0] == 'A':
        PTs[PT_name] = PT(ADC0,PT_channel)
    elif PT_port[0] == 'B':
        PTs[PT_name] = PT(ADC1,PT_channel)

    PTs[PT_name].slope = PTsCfg[PT_name]['offset']
    PTs[PT_name].offset = PTsCfg[PT_name]['offset']

    logging.info("{PTs[PT_name]} has been added successfully")
    

while True:  
    p1 = PTs['PTF201'].getPressure()
    v1 = PTs['PTF201'].voltage

    p2 = PTs['PTF202'].getPressure()
    v2 = PTs['PTF202'].voltage

    formatedText = "{:0>5} PSI | {:0>5} V".format(p1,v1)
    print(formatedText)
    formatedText = "%2.2f PSI | %2.5f V"% (p2,v2)
    print(formatedText)
    
    time.sleep(0.5) 

    
    
