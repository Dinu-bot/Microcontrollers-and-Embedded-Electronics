#line 1 "D:/DINU UNI/UOK/Academic/Year 3/Microcontrollers and Embedded Electronics Laboratory/EXP 1 files/LEDblink/LEDblink.c"
void main() {
 TRISA.RA2=0;
 while(1){
 PORTA.RA2=1;
 Delay_ms(200);
 PORTA.RA2=0;
 Delay_ms(200);
 }
}
