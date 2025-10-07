
void knightrider(void) {
    int i;
    char left = 3;
    char right = 4;

    TRISB = 0x00;
    PORTB = 0x00;

    for (i = 0; i < 4; i++) {
        PORTB |= (1 << left);   // Light LED from center to left
        PORTB |= (1 << right);  // Light LED from center to right
        Delay_ms(200);
        left--;
        right++;
    }
}

void main() {
    CMCON = 0x07;
    while (1)
        knightrider();
}

