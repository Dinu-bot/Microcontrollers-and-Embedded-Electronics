
_knightrider:

;Experiment3Excersise3.c,1 :: 		void knightrider(void) {
;Experiment3Excersise3.c,3 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Experiment3Excersise3.c,4 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Experiment3Excersise3.c,7 :: 		for (i = 0; i <= 6; i += 2) {
	CLRF       R2+0
	CLRF       R2+1
L_knightrider0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider12
	MOVF       R2+0, 0
	SUBLW      6
L__knightrider12:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider1
;Experiment3Excersise3.c,8 :: 		PORTB |= (1 << i);
	MOVF       R2+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__knightrider13:
	BTFSC      STATUS+0, 2
	GOTO       L__knightrider14
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__knightrider13
L__knightrider14:
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;Experiment3Excersise3.c,9 :: 		Delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_knightrider3:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider3
	DECFSZ     R12+0, 1
	GOTO       L_knightrider3
	DECFSZ     R11+0, 1
	GOTO       L_knightrider3
;Experiment3Excersise3.c,7 :: 		for (i = 0; i <= 6; i += 2) {
	MOVLW      2
	ADDWF      R2+0, 1
	BTFSC      STATUS+0, 0
	INCF       R2+1, 1
;Experiment3Excersise3.c,10 :: 		}
	GOTO       L_knightrider0
L_knightrider1:
;Experiment3Excersise3.c,13 :: 		for (i = 7; i >= 1; i -= 2) {
	MOVLW      7
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_knightrider4:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider15
	MOVLW      1
	SUBWF      R2+0, 0
L__knightrider15:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider5
;Experiment3Excersise3.c,14 :: 		PORTB |= (1 << i);
	MOVF       R2+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__knightrider16:
	BTFSC      STATUS+0, 2
	GOTO       L__knightrider17
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__knightrider16
L__knightrider17:
	MOVF       R0+0, 0
	IORWF      PORTB+0, 1
;Experiment3Excersise3.c,15 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_knightrider7:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider7
	DECFSZ     R12+0, 1
	GOTO       L_knightrider7
	DECFSZ     R11+0, 1
	GOTO       L_knightrider7
;Experiment3Excersise3.c,16 :: 		if (i == 1) break;  // Prevent infinite loop
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider18
	MOVLW      1
	XORWF      R2+0, 0
L__knightrider18:
	BTFSS      STATUS+0, 2
	GOTO       L_knightrider8
	GOTO       L_knightrider5
L_knightrider8:
;Experiment3Excersise3.c,13 :: 		for (i = 7; i >= 1; i -= 2) {
	MOVLW      2
	SUBWF      R2+0, 1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
;Experiment3Excersise3.c,17 :: 		}
	GOTO       L_knightrider4
L_knightrider5:
;Experiment3Excersise3.c,18 :: 		}
L_end_knightrider:
	RETURN
; end of _knightrider

_main:

;Experiment3Excersise3.c,20 :: 		void main() {
;Experiment3Excersise3.c,21 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Experiment3Excersise3.c,22 :: 		while (1)
L_main9:
;Experiment3Excersise3.c,23 :: 		knightrider();
	CALL       _knightrider+0
	GOTO       L_main9
;Experiment3Excersise3.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
