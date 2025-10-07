sbit sw1 at RB0_bit;
int state = 0;
int last_state = 0;

void main() {
    TRISB = 0x01;
    PORTB = 0x00;

    while (1) {
        if (sw1 == 1 && last_state == 0) {
            last_state = 1;
            state = !state;
            RB1_bit = state;
            Delay_ms(200);
        }
        else if (sw1 == 0) {
            last_state = 0;
        }
    }
}