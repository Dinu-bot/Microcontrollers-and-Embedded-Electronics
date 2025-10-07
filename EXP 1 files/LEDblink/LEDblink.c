void main() {
         TRISA.RA2=0;
         while(1){
         PORTA.RA2=1;
         Delay_ms(200);
         PORTA.RA2=0;
         Delay_ms(200);
         }
}