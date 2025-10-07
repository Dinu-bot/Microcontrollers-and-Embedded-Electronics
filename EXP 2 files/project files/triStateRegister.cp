#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 2 files/project files/triStateRegister.c"
sbit sw at RA2_bit;
void main() {
 CMCON = 0x07 ;
 TRISA = 0x04 ;
 TRISB = 0x00 ;
 PORTB = 0xFF;
 RA2_bit = 0x00;


 do{

 if(sw==1){
 PORTB = 0x00;

 }
 else{

 PORTB = 0xFF;
 }

 }while(1);

}
