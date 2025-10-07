#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 8 files/exercise/MyProject.c"
sbit sw1 at RA1_bit;
sbit sw2 at RA2_bit;

void main() {
 unsigned short duty_cycle = 0;
 unsigned short duty_value = 0;
 bit prev_sw1;
 bit prev_sw2;

 prev_sw1 = 0;
 prev_sw2 = 0;

 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;

 TRISA = 0x06;
 PORTA = 0x00;

 PWM1_Init(5000);
 PWM1_Start();

 while(1) {

 if (sw1 == 1 && prev_sw1 == 0) {
 if (duty_cycle < 100) {
 duty_cycle += 10;
 }
 }


 if (sw2 == 1 && prev_sw2 == 0) {
 if (duty_cycle >= 10) {
 duty_cycle -= 10;
 }
 }


 duty_value = (unsigned short)((duty_cycle * 255) / 100);
 PWM1_Set_Duty(duty_value);


 prev_sw1 = sw1;
 prev_sw2 = sw2;


 Delay_ms(100);
 }
}
