
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,1 :: 		void interrupt() {
;MyProject.c,3 :: 		if (INTCON.INTF == 1) { // Check external interrupt flag
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;MyProject.c,5 :: 		PORTB.RB1 = 1;
	BSF        PORTB+0, 1
;MyProject.c,6 :: 		PORTB.RB2 = 0;
	BCF        PORTB+0, 2
;MyProject.c,7 :: 		Delay_ms(200); // 200 ms delay
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt1:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt1
	DECFSZ     R12+0, 1
	GOTO       L_interrupt1
	DECFSZ     R11+0, 1
	GOTO       L_interrupt1
;MyProject.c,10 :: 		PORTB.RB1 = 0;
	BCF        PORTB+0, 1
;MyProject.c,11 :: 		PORTB.RB2 = 1;
	BSF        PORTB+0, 2
;MyProject.c,12 :: 		Delay_ms(200); // 200 ms delay
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt2:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt2
	DECFSZ     R12+0, 1
	GOTO       L_interrupt2
	DECFSZ     R11+0, 1
	GOTO       L_interrupt2
;MyProject.c,14 :: 		INTCON.INTF = 0; // Clear external interrupt flag
	BCF        INTCON+0, 1
;MyProject.c,15 :: 		}
L_interrupt0:
;MyProject.c,16 :: 		}
L_end_interrupt:
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,17 :: 		void main() {
;MyProject.c,19 :: 		TRISB = 0b00000001;   // RB0 as input, others as output
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,20 :: 		TRISA = 0b00000000;   // All PORTA as output
	CLRF       TRISA+0
;MyProject.c,21 :: 		CMCON = 0x07;         // Disable comparators (disables RA5 special function)
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,22 :: 		OPTION_REG = 0b10000000; // INT on rising edge, no prescaler
	MOVLW      128
	MOVWF      OPTION_REG+0
;MyProject.c,25 :: 		INTCON.GIE = 1;   // Global interrupt enable
	BSF        INTCON+0, 7
;MyProject.c,26 :: 		INTCON.PEIE = 1;  // Peripheral interrupt enable
	BSF        INTCON+0, 6
;MyProject.c,27 :: 		INTCON.INTE = 1;  // Enable RB0 external interrupt
	BSF        INTCON+0, 4
;MyProject.c,30 :: 		while (1) {
L_main3:
;MyProject.c,32 :: 		PORTB.RB2 = 0;  // RB2 low
	BCF        PORTB+0, 2
;MyProject.c,33 :: 		PORTA.RA0 = 1;  // RA0 high
	BSF        PORTA+0, 0
;MyProject.c,34 :: 		PORTA.RA1 = 0;  // RA1 low
	BCF        PORTA+0, 1
;MyProject.c,35 :: 		Delay_ms(50);   // 50 ms delay
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;MyProject.c,38 :: 		PORTA.RA0 = 0;  // RA0 low
	BCF        PORTA+0, 0
;MyProject.c,39 :: 		PORTA.RA1 = 1;  // RA1 high
	BSF        PORTA+0, 1
;MyProject.c,40 :: 		Delay_ms(50);   // 50 ms delay
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,42 :: 		INTCON.INTF = 0; // Clear interrupt flag (precaution)
	BCF        INTCON+0, 1
;MyProject.c,43 :: 		}
	GOTO       L_main3
;MyProject.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
