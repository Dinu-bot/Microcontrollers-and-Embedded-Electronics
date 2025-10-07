
_main:

;lab07ccode.c,1 :: 		void main() {
;lab07ccode.c,2 :: 		int i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;lab07ccode.c,4 :: 		TRISB = 0b01000011;
	MOVLW      67
	MOVWF      TRISB+0
;lab07ccode.c,5 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;lab07ccode.c,8 :: 		while(1) {
L_main0:
;lab07ccode.c,10 :: 		if(PORTB == 0b00000001) {
	MOVF       PORTB+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;lab07ccode.c,11 :: 		PORTB = 0b00010100;
	MOVLW      20
	MOVWF      PORTB+0
;lab07ccode.c,12 :: 		while(i == 0) {
L_main3:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;lab07ccode.c,13 :: 		if(PORTB.RB6 == 1) {
	BTFSS      PORTB+0, 6
	GOTO       L_main5
;lab07ccode.c,14 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;lab07ccode.c,15 :: 		i = 1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;lab07ccode.c,16 :: 		}
L_main5:
;lab07ccode.c,17 :: 		}
	GOTO       L_main3
L_main4:
;lab07ccode.c,18 :: 		i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;lab07ccode.c,19 :: 		}
	GOTO       L_main6
L_main2:
;lab07ccode.c,20 :: 		else if(PORTB == 0b00000010) {
	MOVF       PORTB+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;lab07ccode.c,21 :: 		PORTB = 0b00101000;
	MOVLW      40
	MOVWF      PORTB+0
;lab07ccode.c,22 :: 		while(i == 0) {
L_main8:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;lab07ccode.c,23 :: 		if(PORTB.RB6 == 1) {
	BTFSS      PORTB+0, 6
	GOTO       L_main10
;lab07ccode.c,24 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;lab07ccode.c,25 :: 		i = 1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;lab07ccode.c,26 :: 		}
L_main10:
;lab07ccode.c,27 :: 		}
	GOTO       L_main8
L_main9:
;lab07ccode.c,28 :: 		i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;lab07ccode.c,29 :: 		}
L_main7:
L_main6:
;lab07ccode.c,30 :: 		}
	GOTO       L_main0
;lab07ccode.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
