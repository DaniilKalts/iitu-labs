#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>

int main(void) {
  DDRB = 0x0F;
  PORTB = 0x00;

  while (1) {
    PORTB = 0x05;
    _delay_ms(3000);

    PORTB = 0x00;
    _delay_ms(1000);

    PORTB = 0x0A;
    _delay_ms(3000);

    PORTB = 0x00;
    _delay_ms(1000);
  }
}
