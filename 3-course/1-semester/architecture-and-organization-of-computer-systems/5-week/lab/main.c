#define F_CPU 8000000UL

#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>

ISR(INT0_vect) {
  PORTC &= ~(1 << PC7);
  _delay_ms(50);
}

int main(void) {
  DDRC |= (1 << PC7);
  PORTC |= (1 << PC7);

  DDRD &= ~(1 << PD0);
  PORTD |= (1 << PD0);

  EICRA &= ~((1 << ISC01) | (1 << ISC00));
  EIMSK |= (1 << INT0);
  sei();

  while (1) {
  }
}
