import time
import socket
import spidev
from configparser import ConfigParser
import logging
import timing


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
    timeStamp: str = ""

    #linear fit variables
    offset = -0.8008008008
    slope = -offset/0.004

    def __init__(self, ADC_init: MCP3008, channel_init: int):  
        # the ADC chip the PT is connected to
        self.ADC = ADC_init
        # the channel the PT is connected to on the ADC val=0...7
        self.channel = channel_init

    def __volts2PSI(self,voltage):
        p1 = abs(self.slope*voltage+self.offset)
        return p1

    def getPressure(self):
        self.voltage, _ = self.ADC.interogate(self.channel)
        self.pressure = self.__volts2PSI(self.voltage)
        self.timeStamp = timing.missionTime()
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

def PTs_init(cfg_file_name: str):
    #Open PT config file
    PTsCfg = ConfigParser()
    PTsCfg.read(cfg_file_name)

    #Creat a PT dictionary
    PTs = dict()
    
    print('Adding PTs from cfg')

    #Generate PT Objects from the cfg file and store them in the PT dictionary
    for PT_name in PTsCfg.sections():
        PT_port = PTsCfg[PT_name]['port']
        PT_channel = int(PT_port[1])-1

        if PT_port[0] == 'A':
            PTs[PT_name] = PT(ADC0,PT_channel)
        elif PT_port[0] == 'B':
            PTs[PT_name] = PT(ADC1,PT_channel)

        PTs[PT_name].slope = float(PTsCfg[PT_name]['slope'])
        PTs[PT_name].offset = float(PTsCfg[PT_name]['offset'])
        
        

        print("[{}] has been added successfully".format(PT_name))

    return PTs
    

def refreshPTs(PT_dict: dict(), PT_freq_Hz: float):
    #The time between reading from PT(n) and PT(n+1)
    PT_period = 1/PT_freq_Hz #seconds
    while True:
        for PT_name in PT_dict:
            PT_dict[PT_name].getPressure()
            #p1 = PT_dict[PT_name].pressure
            #v1 = PT_dict[PT_name].voltage
            #formatedText = "[{}]: {:0>7.2f} PSI | {:0>4.2f} V".format(PT_name,p1,v1)
            #print(formatedText)
            time.sleep(PT_period)
