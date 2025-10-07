#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 3 files/project files/Experiment3Excersise1.c"
sbit sw at RA2_bit;

void rider() {
 char x;
 int i;
 TRISB = 0b00000000;
 TRISA = 0b00000100;

 if (sw == 1) {
 PORTB = 0b00000001;
 Delay_ms(200);
 x = 0b00000010;

 for (i = 0; i < 7; i++) {
 PORTB = PORTB | x;
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
 CMCON = 0x07;
 TRISA = 0b00000100;
 TRISB = 0x00;
 PORTB = 0x00;

 while (1) {
 rider();
 }
}
