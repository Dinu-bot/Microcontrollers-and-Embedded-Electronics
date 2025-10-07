
_main:

;LEDblink.c,1 :: 		void main() {
;LEDblink.c,2 :: 		TRISA.RA2=0;
	BCF        TRISA+0, 2
;LEDblink.c,3 :: 		while(1){
L_main0:
;LEDblink.c,4 :: 		PORTA.RA2=1;
	BSF        PORTA+0, 2
;LEDblink.c,5 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LEDblink.c,6 :: 		PORTA.RA2=0;
	BCF        PORTA+0, 2
;LEDblink.c,7 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;LEDblink.c,8 :: 		}
	GOTO       L_main0
;LEDblink.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
