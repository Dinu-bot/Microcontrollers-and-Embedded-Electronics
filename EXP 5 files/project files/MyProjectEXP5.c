// Step 1: Include necessary libraries for LCD
#include <built_in.h>

// LCD module connections
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

// Step 2: Define text to be displayed on the LCD
char txt1[] = "WELCOME";       // Text #1
char txt2[] = "BECS 31421";    // Text #2
char txt3[] = "EX:LCD";        // Text #3
char txt4[] = "NO:06";         // Text #4
char i; // Loop variable

// Step 3: Define a function to add delay for text moving
void Move_Delay() {
    Delay_ms(500); // 500 ms delay for scrolling effect
}

// Step 4: Define the main function
void main() {
    CCP1CON = 0x00; // Disable CCP1 module
    T1CON = 0x00;   // Disable Timer1
    VRCON = 0x00;   // Disable Voltage Reference module
    INTCON = 0x00;  // Disable global interrupts
    CMCON = 0x07;   // Disable comparators

    // Step 5: Configure LCD settings
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Delay_ms(10);

    Lcd_Out(1, 5, txt1);   // Row 1, Col 5
    Lcd_Out(2, 3, txt2);   // Row 2, Col 3
    Delay_ms(1000);

    Lcd_Cmd(_LCD_CLEAR);

    Lcd_Out(1, 6, txt3);   // Row 1, Col 6
    Lcd_Out(2, 6, txt4);   // Row 2, Col 6
    Delay_ms(1000);

    // Step 6: Scroll right 4 times
    for(i = 0; i < 4; i++) {
        Lcd_Cmd(_LCD_SHIFT_RIGHT);
        Move_Delay();
    }

    // Step 9: Scroll left 9 times
    for(i = 0; i < 9; i++) {
        Lcd_Cmd(_LCD_SHIFT_LEFT);
        Move_Delay();
    }

    // Step 10: Center text by scrolling right 5 times
    for(i = 0; i < 5; i++) {
        Lcd_Cmd(_LCD_SHIFT_RIGHT);
        Move_Delay();
    }

    // Step 11: Endless loop
    while(1) {
        // keep displaying
    }
}



