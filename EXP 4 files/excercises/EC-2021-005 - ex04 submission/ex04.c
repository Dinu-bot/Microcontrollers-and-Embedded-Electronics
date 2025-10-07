                 // Step 1: Declare the main function
void main() {
    // Step 2: Initialize configuration settings
    TRISB = 0x01;    // Set RB0 as input (00000001), others as output
    TRISA = 0x00;    // Set all port A pins as output
    CMCON = 0x07;    // Disable comparators
    OPTION_REG = 0x40; // Configure option register (INT interrupt on falling edge)

    // Step 3: Enable interrupts
    INTCON.GIE = 1;  // Enable global interrupts
    INTCON.PEIE = 0; // Disable peripheral interrupts (not needed for this experiment)
    INTCON.INTE = 1; // Enable RB0/INT interrupt

    // Step 4: Define the infinite loop
    while(1) {       // Infinite loop
        // Step 5: Set initial PORT values
        PORTB.RB2 = 0; // Set RB2 to low
        PORTA.RA0 = 1; // Set RA0 to high
        PORTA.RA1 = 0; // Set RA1 to low
        delay_ms(200);

        // Step 6: Toggle PORT values
        PORTA.RA0 = 0; // Set RA0 to low
        PORTA.RA1 = 1; // Set RA1 to high
        delay_ms(200);
        INTCON.INTF = 0; // Clear the external interrupt flag
    }
}

// Step 7: Interrupt service routine
void interrupt() {
    if(INTCON.INTF) { // Check the external interrupt flag
        // Step 8: Set PORT values upon interrupt
        PORTB.RB1 = 1; // Set RB1 to high
        PORTB.RB2 = 0; // Set RB2 to low
        delay_ms(500);

        // Step 9: Toggle PORT values
        PORTB.RB1 = 0; // Set RB1 to low
        PORTB.RB2 = 1; // Set RB2 to high
        delay_ms(500);
        INTCON.INTF = 0; // Clear the external interrupt flag
    }
}