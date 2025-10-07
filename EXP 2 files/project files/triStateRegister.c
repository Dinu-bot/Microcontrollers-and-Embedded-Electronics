sbit sw at RA2_bit;
void main() {
       CMCON = 0x07 ;   // Disable Comparator
       TRISA = 0x04 ;  //configure TRISA register
       TRISB = 0x00 ;  // Configure TRSB register
       PORTB =  0xFF;   //Intialize PORTB register
       RA2_bit = 0x00;    // Set RA_2bit to low state
       
       //Enter the first loop
       do{
         //Check the state of the switch
           if(sw==1){
               PORTB = 0x00;
            //If the switch is pressed ,set PORTB to be low
           }
           else{
           //If the switch is not pressed,set PORTB to be high
            PORTB = 0xFF;
           }
       
       }while(1);       // Enter a condition for the infinite loop

}