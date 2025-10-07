
_knightrider:

;Experiment3Excersise.c,1 :: 		void knightrider(void) {
;Experiment3Excersise.c,3 :: 		char left = 3;
	MOVLW      3
	MOVWF      knightrider_left_L0+0
	MOVLW      4
	MOVWF      knightrider_right_L0+0
;Experiment3Excersise.c,6 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Experiment3Excersise.c,7 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Experiment3Excersise.c,9 :: 		for (i = 0; i < 4; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_knightrider0:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider7
	MOVLW      4
	SUBWF      R2+0, 0
L__knightrider7:
	BTFSC      STATUS+0, 0
	GOTO       L_knightrider1
;Experiment3Excersise.c,10 :: 		PORTB |= (1 << left);   // Light LED from center to left
	MOVF       knightrider_left_L0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__knightrider8:
	BTFSC      STATUS+0, 2
	GOTO       L__knightrider9
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__knightrider8
L__knightrider9:
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;Experiment3Excersise.c,11 :: 		PORTB |= (1 << right);  // Light LED from center to right
	MOVF       knightrider_right_L0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__knightrider10:
	BTFSC      STATUS+0, 2
	GOTO       L__knightrider11
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__knightrider10
L__knightrider11:
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;Experiment3Excersise.c,12 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_knightrider3:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider3
	DECFSZ     R12+0, 1
	GOTO       L_knightrider3
	DECFSZ     R11+0, 1
	GOTO       L_knightrider3
;Experiment3Excersise.c,13 :: 		left--;
	DECF       knightrider_left_L0+0, 1
;Experiment3Excersise.c,14 :: 		right++;
	INCF       knightrider_right_L0+0, 1
;Experiment3Excersise.c,9 :: 		for (i = 0; i < 4; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;Experiment3Excersise.c,15 :: 		}
	GOTO       L_knightrider0
L_knightrider1:
;Experiment3Excersise.c,16 :: 		}
L_end_knightrider:
	RETURN
; end of _knightrider

_main:

;Experiment3Excersise.c,18 :: 		void main() {
;Experiment3Excersise.c,19 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Experiment3Excersise.c,20 :: 		while (1)
L_main4:
;Experiment3Excersise.c,21 :: 		knightrider();
	CALL       _knightrider+0
	GOTO       L_main4
;Experiment3Excersise.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
