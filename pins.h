#ifndef PINS_H
#define PINS_H

#include <avr/io.h>
#include <stdint.h>

//
void set_pin_on(uint8_t pin);
void set_pin_off(uint8_t pin);
#endif
