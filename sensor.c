#include "pins.h"
#include <avr/io.h>
#include <util/delay.h>

int main(void) {

  // Port5
  DDRB = DDRB | (1 << DDB5);

  while (1) {
    // TODO: Add to a diff function
    set_pin_on(PORTB5);

    _delay_ms(1000);

    // unset PORTB5 TODO: add to a function
    set_pin_off(PORTB5);
    _delay_ms(1000);
  }
}
