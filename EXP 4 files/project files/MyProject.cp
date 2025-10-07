#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 4 files/project files/MyProject.c"
void interrupt() {

 if (INTCON.INTF == 1) {

 PORTB.RB1 = 1;
 PORTB.RB2 = 0;
 Delay_ms(200);


 PORTB.RB1 = 0;
 PORTB.RB2 = 1;
 Delay_ms(200);

 INTCON.INTF = 0;
 }
}
void main() {

 TRISB = 0b00000001;
 TRISA = 0b00000000;
 CMCON = 0x07;
 OPTION_REG = 0b10000000;


 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.INTE = 1;


 while (1) {

 PORTB.RB2 = 0;
 PORTA.RA0 = 1;
 PORTA.RA1 = 0;
 Delay_ms(50);


 PORTA.RA0 = 0;
 PORTA.RA1 = 1;
 Delay_ms(50);

 INTCON.INTF = 0;
 }
}
