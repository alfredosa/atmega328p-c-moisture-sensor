#!/bin/bash

# Compile sensor.c
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o sensor.o sensor.c

# Link object files
avr-gcc -o sensor.bin sensor.o

# Convert binary to hex
avr-objcopy -O ihex -R .eeprom sensor.bin sensor.hex

# Flash firmware onto the device
sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/cu.usbmodem13401 -b 115200 -U flash:w:sensor.hex

