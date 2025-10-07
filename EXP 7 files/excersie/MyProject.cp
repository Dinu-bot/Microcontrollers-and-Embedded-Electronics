#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 7 files/excersie/MyProject.c"
void delay_1s() {
 Delay_ms(1000);
}

void delay_5s() {
 int k;
 for(k = 0; k < 5; k++) delay_1s();
}

void main() {
 int i;

 TRISB = 0b11000011;
 PORTB = 0b00000000;

 while(1) {

 if(PORTB.F0 == 1 && PORTB.F1 == 0) {

 PORTB.F2 = 1;
 PORTB.F4 = 1;

 for(i = 0; i < 10; i++) {
 PORTB.F4 = 1;
 delay_1s();
 PORTB.F4 = 0;
 delay_1s();
 }

 PORTB.F7 = 1;
 PORTB.F4 = 1;
 delay_5s();
 PORTB.F4 = 0;

 while(!(PORTB.F0 && PORTB.F1));
 PORTB = 0b00000000;
 }
 else if(PORTB.F1 == 1 && PORTB.F0 == 0) {

 PORTB.F3 = 1;
 PORTB.F5 = 1;

 for(i = 0; i < 10; i++) {
 PORTB.F5 = 1;
 delay_1s();
 PORTB.F5 = 0;
 delay_1s();
 }

 PORTB.F7 = 1;
 PORTB.F5 = 1;
 delay_5s();
 PORTB.F5 = 0;

 while(!(PORTB.F0 && PORTB.F1));
 PORTB = 0b00000000;
 }

 PORTB.F7 = 0;
 }
}
