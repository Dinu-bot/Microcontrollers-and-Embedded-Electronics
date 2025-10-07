
_main:

;triStateRegister.c,2 :: 		void main() {
;triStateRegister.c,3 :: 		CMCON = 0x07 ;   // Disable Comparator
	MOVLW      7
	MOVWF      CMCON+0
;triStateRegister.c,4 :: 		TRISA = 0x04 ;  //configure TRISA register
	MOVLW      4
	MOVWF      TRISA+0
;triStateRegister.c,5 :: 		TRISB = 0x00 ;  // Configure TRSB register
	CLRF       TRISB+0
;triStateRegister.c,6 :: 		PORTB =  0xFF;   //Intialize PORTB register
	MOVLW      255
	MOVWF      PORTB+0
;triStateRegister.c,7 :: 		RA2_bit = 0x00;    // Set RA_2bit to low state
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;triStateRegister.c,10 :: 		do{
L_main0:
;triStateRegister.c,12 :: 		if(sw==1){
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main3
;triStateRegister.c,13 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;triStateRegister.c,15 :: 		}
	GOTO       L_main4
L_main3:
;triStateRegister.c,18 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;triStateRegister.c,19 :: 		}
L_main4:
;triStateRegister.c,21 :: 		}while(1);       // Enter a condition for the infinite loop
	GOTO       L_main0
;triStateRegister.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
