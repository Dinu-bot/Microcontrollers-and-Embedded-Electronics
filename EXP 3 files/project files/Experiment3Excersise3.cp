#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 3 files/project files/Experiment3Excersise3.c"
void knightrider(void) {
 int i;
 TRISB = 0x00;
 PORTB = 0x00;


 for (i = 0; i <= 6; i += 2) {
 PORTB |= (1 << i);
 Delay_ms(150);
 }


 for (i = 7; i >= 1; i -= 2) {
 PORTB |= (1 << i);
 Delay_ms(200);
 if (i == 1) break;
 }
}

void main() {
 CMCON = 0x07;
 while (1)
 knightrider();
}
