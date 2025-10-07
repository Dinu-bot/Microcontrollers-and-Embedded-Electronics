
_knightrider:

;Experiment3.c,1 :: 		void knightrider(void) {
;Experiment3.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Experiment3.c,5 :: 		PORTB=0x01;
	MOVLW      1
	MOVWF      PORTB+0
;Experiment3.c,6 :: 		for( i =1 ; i<=7 ;i++){
	MOVLW      1
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_knightrider0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider11
	MOVF       R2+0, 0
	SUBLW      7
L__knightrider11:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider1
;Experiment3.c,7 :: 		PORTB = (PORTB <<1);
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Experiment3.c,8 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_knightrider3:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider3
	DECFSZ     R12+0, 1
	GOTO       L_knightrider3
	DECFSZ     R11+0, 1
	GOTO       L_knightrider3
	NOP
;Experiment3.c,6 :: 		for( i =1 ; i<=7 ;i++){
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;Experiment3.c,9 :: 		}
	GOTO       L_knightrider0
L_knightrider1:
;Experiment3.c,10 :: 		for( i =7 ; 7>=i ;i--){
	MOVLW      7
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_knightrider4:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider12
	MOVF       R2+0, 0
	SUBLW      7
L__knightrider12:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider5
;Experiment3.c,11 :: 		PORTB = (PORTB >>1);
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Experiment3.c,12 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_knightrider7:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider7
	DECFSZ     R12+0, 1
	GOTO       L_knightrider7
	DECFSZ     R11+0, 1
	GOTO       L_knightrider7
	NOP
;Experiment3.c,10 :: 		for( i =7 ; 7>=i ;i--){
	MOVLW      1
	SUBWF      R2+0, 1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
;Experiment3.c,13 :: 		}
	GOTO       L_knightrider4
L_knightrider5:
;Experiment3.c,15 :: 		}
L_end_knightrider:
	RETURN
; end of _knightrider

_main:

;Experiment3.c,17 :: 		void main(){
;Experiment3.c,19 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Experiment3.c,20 :: 		TRISA = 0xff;
	MOVLW      255
	MOVWF      TRISA+0
;Experiment3.c,21 :: 		while (1)
L_main8:
;Experiment3.c,22 :: 		knightrider();
	CALL       _knightrider+0
	GOTO       L_main8
;Experiment3.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
