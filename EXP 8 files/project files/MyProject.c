// PWM LED Brightness Control using PIC16F628A
void main() {
    unsigned short duty_cycle; // Declare duty cycle variable

    // Step 1: Configuration settings
    CMCON = 0x07;      // Disable comparators
    TRISB = 0x00;      // Set PORTB as output
    PORTB = 0x00;      // Initialize PORTB to 0

    // Step 2: Initialize and start PWM
    PWM1_Init(5000);   // Initialize PWM1 at 5 kHz
    PWM1_Start();     // Start PWM1

    // Step 3: Infinite loop to vary brightness
    while(1){
      for (duty_cycle=0 ; duty_cycle <=255; duty_cycle +=5){
           PWM1_Set_Duty(duty_cycle);
           Delay_ms(30);
      }
      for (duty_cycle=255;duty_cycle >=0;duty_cycle -=5){
           PWM1_Set_Duty(duty_cycle);
           Delay_ms(30);
      }
    }
}




