TARGET=sensor

MCU=atmega328p
F_CPU=16000000UL

# Compiler and object copy settings
CC=avr-gcc
OBJCOPY=avr-objcopy

# Source files
SRCS=sensor.c pins.c
# Convert the .c filenames to .o to specify the object file targets
OBJS=$(SRCS:.c=.o)

# Compiler flags
CFLAGS=-mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os

# AVRDUDE settings for flashing
AVRDUDE=avrdude
PROGRAMMER=arduino
PORT=/dev/cu.usbmodem13401
BAUD=115200
AVRDUDE_FLAGS=-F -V -c $(PROGRAMMER) -p $(MCU) -P $(PORT) -b $(BAUD) -U flash:w:$(TARGET).hex

# Default target
default: $(TARGET).hex

# Rule for converting ELF to HEX
$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -O ihex -R .eeprom $< $@

# Rule for linking object files into an ELF file
$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Rule for compiling source files to object files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Phony targets for cleaning up and for flashing
.PHONY: clean flash

clean:
	rm -f $(OBJS) $(TARGET).elf $(TARGET).hex

flash: $(TARGET).hex
	sudo $(AVRDUDE) $(AVRDUDE_FLAGS)

