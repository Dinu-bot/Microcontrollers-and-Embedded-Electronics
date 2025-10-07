
_main:

;MyProject.c,6 :: 		void main() {
;MyProject.c,8 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,9 :: 		TRISA = 0x07;
	MOVLW      7
	MOVWF      TRISA+0
;MyProject.c,10 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;MyProject.c,11 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,13 :: 		while(1) {
L_main0:
;MyProject.c,15 :: 		if (!Forward) {
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main2
;MyProject.c,16 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,17 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,18 :: 		RB1_bit = 0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,19 :: 		RB2_bit = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,20 :: 		}
	GOTO       L_main3
L_main2:
;MyProject.c,22 :: 		else if (!Reverse) {
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main4
;MyProject.c,23 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,24 :: 		RB0_bit = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,25 :: 		RB1_bit = 1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,26 :: 		RB2_bit = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,27 :: 		}
	GOTO       L_main5
L_main4:
;MyProject.c,29 :: 		else if (!Brake) {
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main6
;MyProject.c,30 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,31 :: 		}
L_main6:
L_main5:
L_main3:
;MyProject.c,32 :: 		}
	GOTO       L_main0
;MyProject.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
