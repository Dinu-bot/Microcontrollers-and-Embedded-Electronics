
_rider:

;Experiment3Excersise1.c,3 :: 		void rider() {
;Experiment3Excersise1.c,6 :: 		TRISB = 0b00000000;   // Set PORTB as output
	CLRF       TRISB+0
;Experiment3Excersise1.c,7 :: 		TRISA = 0b00000100;   // Set RA2 as input (SW connected)
	MOVLW      4
	MOVWF      TRISA+0
;Experiment3Excersise1.c,9 :: 		if (sw == 1) {
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_rider0
;Experiment3Excersise1.c,10 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;Experiment3Excersise1.c,11 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_rider1:
	DECFSZ     R13+0, 1
	GOTO       L_rider1
	DECFSZ     R12+0, 1
	GOTO       L_rider1
	DECFSZ     R11+0, 1
	GOTO       L_rider1
;Experiment3Excersise1.c,12 :: 		x = 0b00000010;
	MOVLW      2
	MOVWF      R1+0
;Experiment3Excersise1.c,14 :: 		for (i = 0; i < 7; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_rider2:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rider15
	MOVLW      7
	SUBWF      R2+0, 0
L__rider15:
	BTFSC      STATUS+0, 0
	GOTO       L_rider3
;Experiment3Excersise1.c,15 :: 		PORTB = PORTB | x;   // Keep previous LEDs ON
	MOVF       R1+0, 0
	IORWF      PORTB+0, 1
;Experiment3Excersise1.c,16 :: 		x = x << 1;
	RLF        R1+0, 1
	BCF        R1+0, 0
;Experiment3Excersise1.c,17 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_rider5:
	DECFSZ     R13+0, 1
	GOTO       L_rider5
	DECFSZ     R12+0, 1
	GOTO       L_rider5
	DECFSZ     R11+0, 1
	GOTO       L_rider5
	NOP
	NOP
;Experiment3Excersise1.c,14 :: 		for (i = 0; i < 7; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;Experiment3Excersise1.c,18 :: 		}
	GOTO       L_rider2
L_rider3:
;Experiment3Excersise1.c,19 :: 		} else {
	GOTO       L_rider6
L_rider0:
;Experiment3Excersise1.c,20 :: 		PORTB = 0b10000000;
	MOVLW      128
	MOVWF      PORTB+0
;Experiment3Excersise1.c,21 :: 		x = 0b01000000;
	MOVLW      64
	MOVWF      R1+0
;Experiment3Excersise1.c,22 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_rider7:
	DECFSZ     R13+0, 1
	GOTO       L_rider7
	DECFSZ     R12+0, 1
	GOTO       L_rider7
	DECFSZ     R11+0, 1
	GOTO       L_rider7
;Experiment3Excersise1.c,24 :: 		for (i = 0; i < 7; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_rider8:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__rider16
	MOVLW      7
	SUBWF      R2+0, 0
L__rider16:
	BTFSC      STATUS+0, 0
	GOTO       L_rider9
;Experiment3Excersise1.c,25 :: 		PORTB = PORTB | x;
	MOVF       R1+0, 0
	IORWF      PORTB+0, 1
;Experiment3Excersise1.c,26 :: 		x = x >> 1;
	RRF        R1+0, 1
	BCF        R1+0, 7
;Experiment3Excersise1.c,27 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_rider11:
	DECFSZ     R13+0, 1
	GOTO       L_rider11
	DECFSZ     R12+0, 1
	GOTO       L_rider11
	DECFSZ     R11+0, 1
	GOTO       L_rider11
	NOP
	NOP
;Experiment3Excersise1.c,24 :: 		for (i = 0; i < 7; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;Experiment3Excersise1.c,28 :: 		}
	GOTO       L_rider8
L_rider9:
;Experiment3Excersise1.c,29 :: 		}
L_rider6:
;Experiment3Excersise1.c,30 :: 		}
L_end_rider:
	RETURN
; end of _rider

_main:

;Experiment3Excersise1.c,32 :: 		void main() {
;Experiment3Excersise1.c,33 :: 		CMCON = 0x07;           // Disable comparator
	MOVLW      7
	MOVWF      CMCON+0
;Experiment3Excersise1.c,34 :: 		TRISA = 0b00000100;     // RA2 as input
	MOVLW      4
	MOVWF      TRISA+0
;Experiment3Excersise1.c,35 :: 		TRISB = 0x00;           // PORTB as output
	CLRF       TRISB+0
;Experiment3Excersise1.c,36 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Experiment3Excersise1.c,38 :: 		while (1) {
L_main12:
;Experiment3Excersise1.c,39 :: 		rider();
	CALL       _rider+0
;Experiment3Excersise1.c,40 :: 		}
	GOTO       L_main12
;Experiment3Excersise1.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
