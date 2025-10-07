
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,7 :: 		CMCON = 0x07;      // Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,8 :: 		TRISB = 0x00;      // Set PORTB as output
	CLRF       TRISB+0
;MyProject.c,9 :: 		PORTB = 0x00;      // Initialize PORTB to 0
	CLRF       PORTB+0
;MyProject.c,12 :: 		PWM1_Init(5000);   // Initialize PWM1 at 5 kHz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,13 :: 		PWM1_Start();     // Start PWM1
	CALL       _PWM1_Start+0
;MyProject.c,16 :: 		while(1){
L_main0:
;MyProject.c,17 :: 		for (duty_cycle=0 ; duty_cycle <=255; duty_cycle +=5){
	CLRF       main_duty_cycle_L0+0
L_main2:
	MOVF       main_duty_cycle_L0+0, 0
	SUBLW      255
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,18 :: 		PWM1_Set_Duty(duty_cycle);
	MOVF       main_duty_cycle_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,19 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
;MyProject.c,17 :: 		for (duty_cycle=0 ; duty_cycle <=255; duty_cycle +=5){
	MOVLW      5
	ADDWF      main_duty_cycle_L0+0, 1
;MyProject.c,20 :: 		}
	GOTO       L_main2
L_main3:
;MyProject.c,21 :: 		for (duty_cycle=255;duty_cycle >=0;duty_cycle -=5){
	MOVLW      255
	MOVWF      main_duty_cycle_L0+0
L_main6:
	MOVLW      0
	SUBWF      main_duty_cycle_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;MyProject.c,22 :: 		PWM1_Set_Duty(duty_cycle);
	MOVF       main_duty_cycle_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,23 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
;MyProject.c,21 :: 		for (duty_cycle=255;duty_cycle >=0;duty_cycle -=5){
	MOVLW      5
	SUBWF      main_duty_cycle_L0+0, 1
;MyProject.c,24 :: 		}
	GOTO       L_main6
L_main7:
;MyProject.c,27 :: 		}
	GOTO       L_main0
;MyProject.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
