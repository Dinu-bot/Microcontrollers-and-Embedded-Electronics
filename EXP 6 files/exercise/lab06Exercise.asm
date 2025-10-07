
_main:

;lab06Exercise.c,5 :: 		void main() {
;lab06Exercise.c,7 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;lab06Exercise.c,8 :: 		TRISA = 0x07;
	MOVLW      7
	MOVWF      TRISA+0
;lab06Exercise.c,9 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;lab06Exercise.c,10 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;lab06Exercise.c,12 :: 		while(1) {
L_main0:
;lab06Exercise.c,14 :: 		if (!Forward && forwardDone == 0 ) {
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main4
	MOVF       _forwardDone+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main10:
;lab06Exercise.c,15 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;lab06Exercise.c,16 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;lab06Exercise.c,17 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;lab06Exercise.c,18 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;lab06Exercise.c,21 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;lab06Exercise.c,22 :: 		PORTB = 0x00;  // Stop motor
	CLRF       PORTB+0
;lab06Exercise.c,23 :: 		}
	GOTO       L_main6
L_main4:
;lab06Exercise.c,24 :: 		else if (!Reverse) {
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main7
;lab06Exercise.c,25 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;lab06Exercise.c,26 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;lab06Exercise.c,27 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;lab06Exercise.c,28 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;lab06Exercise.c,29 :: 		}
	GOTO       L_main8
L_main7:
;lab06Exercise.c,30 :: 		else if (!Brake) {
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main9
;lab06Exercise.c,31 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;lab06Exercise.c,32 :: 		}
L_main9:
L_main8:
L_main6:
;lab06Exercise.c,33 :: 		}
	GOTO       L_main0
;lab06Exercise.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
