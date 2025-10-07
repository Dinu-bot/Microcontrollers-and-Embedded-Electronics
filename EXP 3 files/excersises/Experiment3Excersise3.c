
void knightrider(void) {
    int i;
    TRISB = 0x00;
    PORTB = 0x00;

    // Forward skipping LEDs
    for (i = 0; i <= 6; i += 2) {
        PORTB |= (1 << i);
        Delay_ms(150);
    }

    // Backward skipping LEDs
    for (i = 7; i >= 1; i -= 2) {
        PORTB |= (1 << i);
        Delay_ms(200);
        if (i == 1) break;  // Prevent infinite loop
    }
}

void main() {
    CMCON = 0x07;
    while (1)
        knightrider();
}
