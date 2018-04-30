from microbit import *
import radio

radio.on()
radio.config(channel=19)        
radio.config(power=7)           

#Event loop.
while True:
        incoming = str(radio.receive())
        print(incoming)
        sleep(200)