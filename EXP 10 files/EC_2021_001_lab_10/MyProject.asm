
_main:

;MyProject.c,5 :: 		void main() {
;MyProject.c,6 :: 		TRISB = 0x01;
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,7 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,9 :: 		while (1) {
L_main0:
;MyProject.c,10 :: 		if (sw1 == 1 && last_state == 0) {
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main4
	MOVLW      0
	XORWF      _last_state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      0
	XORWF      _last_state+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main8:
;MyProject.c,11 :: 		last_state = 1;
	MOVLW      1
	MOVWF      _last_state+0
	MOVLW      0
	MOVWF      _last_state+1
;MyProject.c,12 :: 		state = !state;
	MOVF       _state+0, 0
	IORWF      _state+1, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _state+0
	MOVWF      _state+1
	MOVLW      0
	MOVWF      _state+1
;MyProject.c,13 :: 		RB1_bit = state;
	BTFSC      _state+0, 0
	GOTO       L__main11
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main12
L__main11:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
L__main12:
;MyProject.c,14 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;MyProject.c,15 :: 		}
	GOTO       L_main6
L_main4:
;MyProject.c,16 :: 		else if (sw1 == 0) {
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main7
;MyProject.c,17 :: 		last_state = 0;
	CLRF       _last_state+0
	CLRF       _last_state+1
;MyProject.c,18 :: 		}
L_main7:
L_main6:
;MyProject.c,19 :: 		}
	GOTO       L_main0
;MyProject.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
