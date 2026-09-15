/*
 * GccApplication1.c
 *
 * Created: 9/15/2026 8:24:57 PM
 * Author : daniilkalts
 */

#define F_CPU 8000000UL

// Data Direction Register
// Port B Data Register
// Port B, Pin 0

#include <avr/io.h>
#include <util/delay.h>

void led_on(void) { PORTB |= (1 << PB0); }

void led_off(void) { PORTB &= ~(1 << PB0); }

void dot(void) {
  led_on();
  _delay_ms(200);
  led_off();
  _delay_ms(200);
}

void dash(void) {
  led_on();
  _delay_ms(600);
  led_off();
  _delay_ms(200);
}

void letter_pause(void) { _delay_ms(600); }

void word_pause(void) { _delay_ms(1400); }

int main(void) {
  DDRB |= (1 << PB0);
  led_off();

  while (1) {
    // D = -..
    dash();
    dot();
    dot();
    letter_pause();

    // A = .-
    dot();
    dash();
    letter_pause();

    // N = -.
    dash();
    dot();
    letter_pause();

    // I = ..
    dot();
    dot();
    letter_pause();

    // I = ..
    dot();
    dot();
    letter_pause();

    // L = .-..
    dot();
    dash();
    dot();
    dot();
    word_pause();
  }
}
