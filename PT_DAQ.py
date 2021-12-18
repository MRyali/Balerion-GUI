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

    
    
    time.sleep(sleepTime)
    
    
