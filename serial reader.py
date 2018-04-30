import argparse
import random
import time
import serial

import OSC

send_address = '127.0.0.1', 6448

# OSC basic client
c = OSC.OSCClient()
c.connect( send_address ) # set the address for all following messages


s=serial.Serial("/dev/cu.usbmodem14512")
s.baudrate=115200
while True:
    data = s.readline()
    print(data)
    arr = data.split(',')
    print(arr)
    msg = OSC.OSCMessage()
    msg.setAddress("/wek/inputs")
    x=1
    while (x<4):
        print(float(arr[x]))
        msg.append(float(arr[x]))
        x+=1
    print(len(msg))
    c.send(msg)
