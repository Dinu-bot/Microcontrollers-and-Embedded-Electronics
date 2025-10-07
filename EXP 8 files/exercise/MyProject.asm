
_main:

;MyProject.c,4 :: 		void main() {
;MyProject.c,5 :: 		unsigned short duty_cycle = 0;
	CLRF       main_duty_cycle_L0+0
;MyProject.c,10 :: 		prev_sw1 = 0;
	BCF        main_prev_sw1_L0+0, BitPos(main_prev_sw1_L0+0)
;MyProject.c,11 :: 		prev_sw2 = 0;
	BCF        main_prev_sw2_L0+0, BitPos(main_prev_sw2_L0+0)
;MyProject.c,13 :: 		CMCON = 0x07;       // Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,14 :: 		TRISB = 0x00;       // Set PORTB as output
	CLRF       TRISB+0
;MyProject.c,15 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,17 :: 		TRISA = 0x06;       // RA1 and RA2 as inputs, others as outputs
	MOVLW      6
	MOVWF      TRISA+0
;MyProject.c,18 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;MyProject.c,20 :: 		PWM1_Init(5000);    // 5kHz PWM frequency
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,21 :: 		PWM1_Start();       // Start PWM
	CALL       _PWM1_Start+0
;MyProject.c,23 :: 		while(1) {
L_main0:
;MyProject.c,25 :: 		if (sw1 == 1 && prev_sw1 == 0) {
	BTFSS      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main4
	BTFSC      main_prev_sw1_L0+0, BitPos(main_prev_sw1_L0+0)
	GOTO       L_main4
L__main12:
;MyProject.c,26 :: 		if (duty_cycle < 100) {
	MOVLW      100
	SUBWF      main_duty_cycle_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,27 :: 		duty_cycle += 10;   // Increase brightness by 10%
	MOVLW      10
	ADDWF      main_duty_cycle_L0+0, 1
;MyProject.c,28 :: 		}
L_main5:
;MyProject.c,29 :: 		}
L_main4:
;MyProject.c,32 :: 		if (sw2 == 1 && prev_sw2 == 0) {
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main8
	BTFSC      main_prev_sw2_L0+0, BitPos(main_prev_sw2_L0+0)
	GOTO       L_main8
L__main11:
;MyProject.c,33 :: 		if (duty_cycle >= 10) {
	MOVLW      10
	SUBWF      main_duty_cycle_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;MyProject.c,34 :: 		duty_cycle -= 10;   // Decrease brightness by 10%
	MOVLW      10
	SUBWF      main_duty_cycle_L0+0, 1
;MyProject.c,35 :: 		}
L_main9:
;MyProject.c,36 :: 		}
L_main8:
;MyProject.c,39 :: 		duty_value = (unsigned short)((duty_cycle * 255) / 100);
	MOVF       main_duty_cycle_L0+0, 0
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
;MyProject.c,40 :: 		PWM1_Set_Duty(duty_value);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,43 :: 		prev_sw1 = sw1;
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L__main14
	BCF        main_prev_sw1_L0+0, BitPos(main_prev_sw1_L0+0)
	GOTO       L__main15
L__main14:
	BSF        main_prev_sw1_L0+0, BitPos(main_prev_sw1_L0+0)
L__main15:
;MyProject.c,44 :: 		prev_sw2 = sw2;
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L__main16
	BCF        main_prev_sw2_L0+0, BitPos(main_prev_sw2_L0+0)
	GOTO       L__main17
L__main16:
	BSF        main_prev_sw2_L0+0, BitPos(main_prev_sw2_L0+0)
L__main17:
;MyProject.c,47 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
;MyProject.c,48 :: 		}
	GOTO       L_main0
;MyProject.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
