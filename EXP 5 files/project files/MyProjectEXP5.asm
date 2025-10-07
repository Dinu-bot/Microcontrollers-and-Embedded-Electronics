
_Move_Delay:

;MyProjectEXP5.c,27 :: 		void Move_Delay() {
;MyProjectEXP5.c,28 :: 		Delay_ms(500); // 500 ms delay for scrolling effect
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
	NOP
;MyProjectEXP5.c,29 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;MyProjectEXP5.c,32 :: 		void main() {
;MyProjectEXP5.c,33 :: 		CCP1CON = 0x00; // Disable CCP1 module
	CLRF       CCP1CON+0
;MyProjectEXP5.c,34 :: 		T1CON = 0x00;   // Disable Timer1
	CLRF       T1CON+0
;MyProjectEXP5.c,35 :: 		VRCON = 0x00;   // Disable Voltage Reference module
	CLRF       VRCON+0
;MyProjectEXP5.c,36 :: 		INTCON = 0x00;  // Disable global interrupts
	CLRF       INTCON+0
;MyProjectEXP5.c,37 :: 		CMCON = 0x07;   // Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;MyProjectEXP5.c,40 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProjectEXP5.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectEXP5.c,42 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectEXP5.c,43 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
;MyProjectEXP5.c,45 :: 		Lcd_Out(1, 5, txt1);   // Row 1, Col 5
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectEXP5.c,46 :: 		Lcd_Out(2, 3, txt2);   // Row 2, Col 3
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectEXP5.c,47 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProjectEXP5.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectEXP5.c,51 :: 		Lcd_Out(1, 6, txt3);   // Row 1, Col 6
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectEXP5.c,52 :: 		Lcd_Out(2, 6, txt4);   // Row 2, Col 6
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectEXP5.c,53 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProjectEXP5.c,56 :: 		for(i = 0; i < 4; i++) {
	CLRF       _i+0
L_main4:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProjectEXP5.c,57 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectEXP5.c,58 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProjectEXP5.c,56 :: 		for(i = 0; i < 4; i++) {
	INCF       _i+0, 1
;MyProjectEXP5.c,59 :: 		}
	GOTO       L_main4
L_main5:
;MyProjectEXP5.c,62 :: 		for(i = 0; i < 9; i++) {
	CLRF       _i+0
L_main7:
	MOVLW      9
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;MyProjectEXP5.c,63 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectEXP5.c,64 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProjectEXP5.c,62 :: 		for(i = 0; i < 9; i++) {
	INCF       _i+0, 1
;MyProjectEXP5.c,65 :: 		}
	GOTO       L_main7
L_main8:
;MyProjectEXP5.c,68 :: 		for(i = 0; i < 5; i++) {
	CLRF       _i+0
L_main10:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;MyProjectEXP5.c,69 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectEXP5.c,70 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProjectEXP5.c,68 :: 		for(i = 0; i < 5; i++) {
	INCF       _i+0, 1
;MyProjectEXP5.c,71 :: 		}
	GOTO       L_main10
L_main11:
;MyProjectEXP5.c,74 :: 		while(1) {
L_main13:
;MyProjectEXP5.c,76 :: 		}
	GOTO       L_main13
;MyProjectEXP5.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
