void delay_1s() {
    Delay_ms(1000); // Use mikroC's built-in delay
}

void delay_5s() {
    int k;
    for(k = 0; k < 5; k++) delay_1s();
}

void main() {
    int i;

    TRISB = 0b11000011; // RB7, RB6, RB1, RB0 as input; others output
    PORTB = 0b00000000; // All outputs off

    while(1) {
        // Wait for either player to press their button
        if(PORTB.F0 == 1 && PORTB.F1 == 0) {
            // Player 1 pressed
            PORTB.F2 = 1; // Player 1 LED ON (assuming RB2)
            PORTB.F4 = 1; // Player 1 Buzzer ON (assuming RB4)
            // 10 beeps, 1s each
            for(i = 0; i < 10; i++) {
                PORTB.F4 = 1; // Buzzer ON
                delay_1s();
                PORTB.F4 = 0; // Buzzer OFF
                delay_1s();
            }
            // Game Over: RB7 ON, Buzzer ON for 5s
            PORTB.F7 = 1; // Game Over LED ON
            PORTB.F4 = 1; // Buzzer ON
            delay_5s();
            PORTB.F4 = 0; // Buzzer OFF
            // Wait for both players to press for reset
            while(!(PORTB.F0 && PORTB.F1));
            PORTB = 0b00000000; // Reset all
        }
        else if(PORTB.F1 == 1 && PORTB.F0 == 0) {
            // Player 2 pressed
            PORTB.F3 = 1; // Player 2 LED ON (assuming RB3)
            PORTB.F5 = 1; // Player 2 Buzzer ON (assuming RB5)
            // 10 beeps, 1s each
            for(i = 0; i < 10; i++) {
                PORTB.F5 = 1; // Buzzer ON
                delay_1s();
                PORTB.F5 = 0; // Buzzer OFF
                delay_1s();
            }
            // Game Over: RB7 ON, Buzzer ON for 5s
            PORTB.F7 = 1; // Game Over LED ON
            PORTB.F5 = 1; // Buzzer ON
            delay_5s();
            PORTB.F5 = 0; // Buzzer OFF
            // Wait for both players to press for reset
            while(!(PORTB.F0 && PORTB.F1));
            PORTB = 0b00000000; // Reset all
        }
        // Game Over LED OFF after reset
        PORTB.F7 = 0;
    }
}
