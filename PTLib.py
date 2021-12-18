import time
import socket
import spidev


class MCP3008:
    def __init__(self,SPI_init, channel_init):
        self.SPI = SPI_init
        self.channel = channel_init

    def readMCP3008(self):
        #gets the raw 10-bit value from the MCP3008 ADC

        rawData = self.SPI.xfer([1, (8 + self.channel) << 4, 0])

        #convert 8-bit message to a 10-bit reading
        processedData = ((rawData[1]&3) << 8) + rawData[2]

        #processedData = 0...1023
        return processedData

    def dig2volts(self,digitalReading: int):
        voltage = (digitalReading * 5.365) / 1023
        return voltage

    def interogate(self):
        data = self.readMCP3008()
        voltage = self.dig2volts(data)
        return (voltage, data)

#Defining the Pressure Tansducer Class
class PT:
    #physical values
    voltage: float = 0
    pressure: float = 0

    #linear fit variables
    y_offset = -0.8008008008
    slope = -y_offset/0.004

    def __init__(self, ADC_init: MCP3008):
        self.ADC = ADC_init

    def __volts2PSI(self,voltage):
        p1 = abs(self.slope*voltage+self.y_offset)
        return p1

    def getPressure(self):
        self.voltage, _ = self.ADC.interogate
        self.pressure = self.__volts2PSI(self.voltage)
        return self.pressure

def openSPI(chip, frequency):
    #opens an SPI channel
    spi = spidev.SpiDev()
    spi.open(0,chip)
    spi.max_speed_hz = frequency
    return spi

SPI0 = openSPI(0, 1000)
PTF201 = PT(MCP3008(SPI0,0))

while True:
    p1 = PTF201.getPressure
    v1 = PTF201.voltage

    formatedText = "%2.2f PSI | %2.5f V"% (p1,v1)
    print(formatedText)

    time.sleep(0.1) 





""" 
import spidev
import time
import socket

spi = spidev.SpiDev()
spi_2=spidev.SpiDev()
spi.open(0,0)
spi_2.open(0,1)
spi.max_speed_hz = 1000
spi_2.max_speed_hz = 1000

sleepTime = 0.1

channel_0 = 0
channel_1 = 1
channel_2 = 2

def getReading(cs, channel):
    if cs == 0:
        rawData = spi.xfer([1, (8 + channel) << 4, 0])
    else:
        rawData = spi_2.xfer([1, (8 + channel) << 4, 0])
    #GPIO.output(chipSelect_0, False)
    processedData = ((rawData[1]&3) << 8) + rawData[2]
    data = (processedData * 5.365) / 1023
    return data
    
time_0 = time.time()



s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('172.20.10.2',5234))

while True:
    v1 = getReading(0, 0)
    
    b = -0.8008008008
    a = -b/0.004
    
    p1 = abs(a*v1+b)
    
    time.sleep(sleepTime)
    
    
    formatedText = "%2.2f PSI | %2.5f V"% (p1,v1)
    
    print(formatedText)
    s.send(bytes(formatedText,"utf-8"))

    
    
    time.sleep(sleepTime) """
    
    
