#include "pins.h"
//
void set_pin_on(uint8_t pin) {
  // incoming pin, shift 1 bit to the left, to land the
  // exact pin, then use the OR op to set the pin on
  PORTB = PORTB | (1 << pin);
}
void set_pin_off(uint8_t pin) {
  // incoming pin, shift 1 bit to the left
  // then use the AND op to set the pin off.
  PORTB = PORTB & ~(1 << pin);
}
