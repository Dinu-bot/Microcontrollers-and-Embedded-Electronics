sbit sw at RA2_bit;

void rider() {
    char x;
    int i;
    TRISB = 0b00000000;   // Set PORTB as output
    TRISA = 0b00000100;   // Set RA2 as input (SW connected)

    if (sw == 1) {
        PORTB = 0b00000001;
        Delay_ms(200);
        x = 0b00000010;

        for (i = 0; i < 7; i++) {
            PORTB = PORTB | x;   // Keep previous LEDs ON
            x = x << 1;
            Delay_ms(250);
        }
    } else {
        PORTB = 0b10000000;
        x = 0b01000000;
        Delay_ms(200);

        for (i = 0; i < 7; i++) {
            PORTB = PORTB | x;
            x = x >> 1;
            Delay_ms(250);
        }
    }
}

void main() {
    CMCON = 0x07;           // Disable comparator
    TRISA = 0b00000100;     // RA2 as input
    TRISB = 0x00;           // PORTB as output
    PORTB = 0x00;

    while (1) {
        rider();
    }
}


