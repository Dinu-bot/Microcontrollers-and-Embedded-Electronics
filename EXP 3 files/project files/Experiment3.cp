#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 3 files/project files/Experiment3.c"
void knightrider(void) {

 int i;
 TRISB = 0x00;
 PORTB=0x01;
 for( i =1 ; i<=7 ;i++){
 PORTB = (PORTB <<1);
 Delay_ms(100);
 }
 for( i =7 ; 7>=i ;i--){
 PORTB = (PORTB >>1);
 Delay_ms(100);
 }

}

void main(){

 CMCON = 0x07;
 TRISA = 0xff;
 while (1)
 knightrider();
}
