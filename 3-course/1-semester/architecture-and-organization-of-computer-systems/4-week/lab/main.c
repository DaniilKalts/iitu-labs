#define F_CPU 8000000UL

#include <avr/io.h>
#include <util/delay.h>

void pwm_init(void) {
  DDRB |= (1 << PB7);

  TCCR0A = (1 << WGM00) | (1 << WGM01) | (1 << COM0A1);
  TCCR0B = (1 << CS00);

  OCR0A = 0;
}

int main(void) {
  pwm_init();

  DDRA &= ~(1 << PA0);
  PORTA |= (1 << PA0);

  int brightness = 0;
  int direction = 1;

  while (1) {
    if (!(PINA & (1 << PA0))) {
      brightness += direction;

      if (brightness >= 255) {
        brightness = 255;
        direction = -1;
      } else if (brightness <= 0) {
        brightness = 0;
        direction = 1;
      }

      OCR0A = brightness;
    }

    _delay_ms(10);
  }
}
