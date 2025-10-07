
_delay_1s:

;MyProject.c,1 :: 		void delay_1s() {
;MyProject.c,2 :: 		Delay_ms(1000); // Use mikroC's built-in delay
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_delay_1s0:
	DECFSZ     R13+0, 1
	GOTO       L_delay_1s0
	DECFSZ     R12+0, 1
	GOTO       L_delay_1s0
	DECFSZ     R11+0, 1
	GOTO       L_delay_1s0
	NOP
	NOP
;MyProject.c,3 :: 		}
L_end_delay_1s:
	RETURN
; end of _delay_1s

_delay_5s:

;MyProject.c,5 :: 		void delay_5s() {
;MyProject.c,7 :: 		for(k = 0; k < 5; k++) delay_1s();
	CLRF       delay_5s_k_L0+0
	CLRF       delay_5s_k_L0+1
L_delay_5s1:
	MOVLW      128
	XORWF      delay_5s_k_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_5s31
	MOVLW      5
	SUBWF      delay_5s_k_L0+0, 0
L__delay_5s31:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_5s2
	CALL       _delay_1s+0
	INCF       delay_5s_k_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       delay_5s_k_L0+1, 1
	GOTO       L_delay_5s1
L_delay_5s2:
;MyProject.c,8 :: 		}
L_end_delay_5s:
	RETURN
; end of _delay_5s

_main:

;MyProject.c,10 :: 		void main() {
;MyProject.c,13 :: 		TRISB = 0b11000011; // RB7, RB6, RB1, RB0 as input; others output
	MOVLW      195
	MOVWF      TRISB+0
;MyProject.c,14 :: 		PORTB = 0b00000000; // All outputs off
	CLRF       PORTB+0
;MyProject.c,16 :: 		while(1) {
L_main4:
;MyProject.c,18 :: 		if(PORTB.F0 == 1 && PORTB.F1 == 0) {
	BTFSS      PORTB+0, 0
	GOTO       L_main8
	BTFSC      PORTB+0, 1
	GOTO       L_main8
L__main28:
;MyProject.c,20 :: 		PORTB.F2 = 1; // Player 1 LED ON (assuming RB2)
	BSF        PORTB+0, 2
;MyProject.c,21 :: 		PORTB.F4 = 1; // Player 1 Buzzer ON (assuming RB4)
	BSF        PORTB+0, 4
;MyProject.c,23 :: 		for(i = 0; i < 10; i++) {
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main9:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;MyProject.c,24 :: 		PORTB.F4 = 1; // Buzzer ON
	BSF        PORTB+0, 4
;MyProject.c,25 :: 		delay_1s();
	CALL       _delay_1s+0
;MyProject.c,26 :: 		PORTB.F4 = 0; // Buzzer OFF
	BCF        PORTB+0, 4
;MyProject.c,27 :: 		delay_1s();
	CALL       _delay_1s+0
;MyProject.c,23 :: 		for(i = 0; i < 10; i++) {
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;MyProject.c,28 :: 		}
	GOTO       L_main9
L_main10:
;MyProject.c,30 :: 		PORTB.F7 = 1; // Game Over LED ON
	BSF        PORTB+0, 7
;MyProject.c,31 :: 		PORTB.F4 = 1; // Buzzer ON
	BSF        PORTB+0, 4
;MyProject.c,32 :: 		delay_5s();
	CALL       _delay_5s+0
;MyProject.c,33 :: 		PORTB.F4 = 0; // Buzzer OFF
	BCF        PORTB+0, 4
;MyProject.c,35 :: 		while(!(PORTB.F0 && PORTB.F1));
L_main12:
	BTFSS      PORTB+0, 0
	GOTO       L_main15
	BTFSS      PORTB+0, 1
	GOTO       L_main15
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_main14
L_main15:
	CLRF       R0+0
L_main14:
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;MyProject.c,36 :: 		PORTB = 0b00000000; // Reset all
	CLRF       PORTB+0
;MyProject.c,37 :: 		}
	GOTO       L_main16
L_main8:
;MyProject.c,38 :: 		else if(PORTB.F1 == 1 && PORTB.F0 == 0) {
	BTFSS      PORTB+0, 1
	GOTO       L_main19
	BTFSC      PORTB+0, 0
	GOTO       L_main19
L__main27:
;MyProject.c,40 :: 		PORTB.F3 = 1; // Player 2 LED ON (assuming RB3)
	BSF        PORTB+0, 3
;MyProject.c,41 :: 		PORTB.F5 = 1; // Player 2 Buzzer ON (assuming RB5)
	BSF        PORTB+0, 5
;MyProject.c,43 :: 		for(i = 0; i < 10; i++) {
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main20:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main34:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;MyProject.c,44 :: 		PORTB.F5 = 1; // Buzzer ON
	BSF        PORTB+0, 5
;MyProject.c,45 :: 		delay_1s();
	CALL       _delay_1s+0
;MyProject.c,46 :: 		PORTB.F5 = 0; // Buzzer OFF
	BCF        PORTB+0, 5
;MyProject.c,47 :: 		delay_1s();
	CALL       _delay_1s+0
;MyProject.c,43 :: 		for(i = 0; i < 10; i++) {
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;MyProject.c,48 :: 		}
	GOTO       L_main20
L_main21:
;MyProject.c,50 :: 		PORTB.F7 = 1; // Game Over LED ON
	BSF        PORTB+0, 7
;MyProject.c,51 :: 		PORTB.F5 = 1; // Buzzer ON
	BSF        PORTB+0, 5
;MyProject.c,52 :: 		delay_5s();
	CALL       _delay_5s+0
;MyProject.c,53 :: 		PORTB.F5 = 0; // Buzzer OFF
	BCF        PORTB+0, 5
;MyProject.c,55 :: 		while(!(PORTB.F0 && PORTB.F1));
L_main23:
	BTFSS      PORTB+0, 0
	GOTO       L_main26
	BTFSS      PORTB+0, 1
	GOTO       L_main26
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_main25
L_main26:
	CLRF       R0+0
L_main25:
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main24
	GOTO       L_main23
L_main24:
;MyProject.c,56 :: 		PORTB = 0b00000000; // Reset all
	CLRF       PORTB+0
;MyProject.c,57 :: 		}
L_main19:
L_main16:
;MyProject.c,59 :: 		PORTB.F7 = 0;
	BCF        PORTB+0, 7
;MyProject.c,60 :: 		}
	GOTO       L_main4
;MyProject.c,61 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
