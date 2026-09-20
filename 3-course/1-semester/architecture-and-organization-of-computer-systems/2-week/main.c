#include <avr/io.h>

#define F_CPU 1000000UL

#include <util/delay.h>

// My last name is Kalts, which starts with a K.
// K in ASCII: 0x4B 01001011

#define CODE_LETTER 0b01001011

void dash(void) {
  PORTC = 0x03;
  _delay_ms(400);

  PORTC = 0x00;
  _delay_ms(50);
}

void dot(void) {
  PORTC = 0x03;
  _delay_ms(100);

  PORTC = 0x00;
  _delay_ms(50);
}

int main(void) {
  DDRA = 0x00;

  DDRC = 0xff;

  PORTC = 0x0;

  int codeLetter = 0;

  int letterCursor = 0;

  while (1) {
    if (!(PINA & 0x1)) {
      dot();

      codeLetter &= ~(1 << letterCursor);

      letterCursor++;
    }

    if (!(PINA & 0x2)) // SW1
    {
      dot();

      codeLetter |= (1 << letterCursor);

      letterCursor++;
    }

    if (!(PINA & 0x4)) // SW2
    {
      dash();

      letterCursor = 0;

      codeLetter = 0;
    }

    if (letterCursor >= 8) {
      if (codeLetter == CODE_LETTER) {
        dot();

        dot();

        dot();
      } else {
        dash();

        dash();

        dash();
      }

      letterCursor = 0;

      codeLetter = 0;
    }

    _delay_ms(100);
  }

  return 0;
}
