#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 6 files/project files/MyProject.c"

sbit Forward at RA0_bit;
sbit Reverse at RA1_bit;
sbit Brake at RA2_bit;

void main() {

 CMCON = 0x07;
 TRISA = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;

 while(1) {

 if (!Forward) {
 PORTB = 0x00;
 RB0_bit = 1;
 RB1_bit = 0;
 RB2_bit = 1;
 }

 else if (!Reverse) {
 PORTB = 0x00;
 RB0_bit = 1;
 RB1_bit = 1;
 RB2_bit = 0;
 }

 else if (!Brake) {
 PORTB = 0x00;
 }
 }
}
