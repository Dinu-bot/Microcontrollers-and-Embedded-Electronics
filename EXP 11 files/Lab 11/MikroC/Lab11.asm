
_ResetCalculator:

;Lab11.c,30 :: 		void ResetCalculator() {
;Lab11.c,31 :: 		PW1 = PW2 = PW3 = PW4 = PW5 = number1 = number2 = Answer = 0;
	CLRF       _Answer+0
	CLRF       _Answer+1
	CLRF       _Answer+2
	CLRF       _Answer+3
	CLRF       _number2+0
	CLRF       _number2+1
	CLRF       _number1+0
	CLRF       _number1+1
	CLRF       _PW5+0
	CLRF       _PW5+1
	CLRF       _PW4+0
	CLRF       _PW4+1
	CLRF       _PW3+0
	CLRF       _PW3+1
	CLRF       _PW2+0
	CLRF       _PW2+1
	CLRF       _PW1+0
	CLRF       _PW1+1
;Lab11.c,32 :: 		state = 0;
	CLRF       _state+0
	CLRF       _state+1
;Lab11.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab11.c,34 :: 		Lcd_Out(1, 1, "Enter Values:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Lab11+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab11.c,35 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab11.c,36 :: 		Lcd_Cmd(_LCD_BLINK_CURSOR_ON);
	MOVLW      15
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab11.c,37 :: 		}
L_end_ResetCalculator:
	RETURN
; end of _ResetCalculator

_main:

;Lab11.c,39 :: 		void main() {
;Lab11.c,40 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Lab11.c,41 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;Lab11.c,42 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;Lab11.c,44 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Lab11.c,45 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Lab11.c,46 :: 		ResetCalculator();
	CALL       _ResetCalculator+0
;Lab11.c,48 :: 		while (1) {
L_main0:
;Lab11.c,49 :: 		do {
L_main2:
;Lab11.c,50 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
	CLRF       _kp+1
;Lab11.c,51 :: 		Delay_ms(50);  // Debounce Delay
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
;Lab11.c,52 :: 		} while (!kp);
	MOVF       _kp+0, 0
	IORWF      _kp+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Lab11.c,55 :: 		switch (kp) {
	GOTO       L_main6
;Lab11.c,56 :: 		case  1: val = 1; break;
L_main8:
	MOVLW      1
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,57 :: 		case  2: val = 4; break;
L_main9:
	MOVLW      4
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,58 :: 		case  3: val = 7; break;
L_main10:
	MOVLW      7
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,59 :: 		case  4: ResetCalculator(); continue;
L_main11:
	CALL       _ResetCalculator+0
	GOTO       L_main0
;Lab11.c,60 :: 		case  5: val = 2; break;
L_main12:
	MOVLW      2
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,61 :: 		case  6: val = 5; break;
L_main13:
	MOVLW      5
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,62 :: 		case  7: val = 8; break;
L_main14:
	MOVLW      8
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,63 :: 		case  8: val = 0; break;
L_main15:
	CLRF       _val+0
	CLRF       _val+1
	GOTO       L_main7
;Lab11.c,64 :: 		case  9: val = 3; break;
L_main16:
	MOVLW      3
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,65 :: 		case 10: val = 6; break;
L_main17:
	MOVLW      6
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,66 :: 		case 11: val = 9; break;
L_main18:
	MOVLW      9
	MOVWF      _val+0
	MOVLW      0
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,67 :: 		case 12: val = '='; break;
L_main19:
	MOVLW      61
	MOVWF      _val+0
	CLRF       _val+1
	GOTO       L_main7
;Lab11.c,68 :: 		case 13: val = '/'; break;
L_main20:
	MOVLW      47
	MOVWF      _val+0
	CLRF       _val+1
	GOTO       L_main7
;Lab11.c,69 :: 		case 14: val = '*'; break;
L_main21:
	MOVLW      42
	MOVWF      _val+0
	CLRF       _val+1
	GOTO       L_main7
;Lab11.c,70 :: 		case 15: val = '-'; break;
L_main22:
	MOVLW      45
	MOVWF      _val+0
	CLRF       _val+1
	GOTO       L_main7
;Lab11.c,71 :: 		case 16: val = '+'; break;
L_main23:
	MOVLW      43
	MOVWF      _val+0
	CLRF       _val+1
	GOTO       L_main7
;Lab11.c,72 :: 		default: val = -1; break;
L_main24:
	MOVLW      255
	MOVWF      _val+0
	MOVLW      255
	MOVWF      _val+1
	GOTO       L_main7
;Lab11.c,73 :: 		}
L_main6:
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      1
	XORWF      _kp+0, 0
L__main61:
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      2
	XORWF      _kp+0, 0
L__main62:
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      3
	XORWF      _kp+0, 0
L__main63:
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      4
	XORWF      _kp+0, 0
L__main64:
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      5
	XORWF      _kp+0, 0
L__main65:
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      6
	XORWF      _kp+0, 0
L__main66:
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      7
	XORWF      _kp+0, 0
L__main67:
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      8
	XORWF      _kp+0, 0
L__main68:
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      9
	XORWF      _kp+0, 0
L__main69:
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      10
	XORWF      _kp+0, 0
L__main70:
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      11
	XORWF      _kp+0, 0
L__main71:
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      12
	XORWF      _kp+0, 0
L__main72:
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      13
	XORWF      _kp+0, 0
L__main73:
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main74
	MOVLW      14
	XORWF      _kp+0, 0
L__main74:
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      15
	XORWF      _kp+0, 0
L__main75:
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      16
	XORWF      _kp+0, 0
L__main76:
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	GOTO       L_main24
L_main7:
;Lab11.c,76 :: 		if (val >= 0 && val <= 9) {
	MOVLW      128
	XORWF      _val+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVLW      0
	SUBWF      _val+0, 0
L__main77:
	BTFSS      STATUS+0, 0
	GOTO       L_main27
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _val+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVF       _val+0, 0
	SUBLW      9
L__main78:
	BTFSS      STATUS+0, 0
	GOTO       L_main27
L__main58:
;Lab11.c,77 :: 		if (state == 0) {
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      0
	XORWF      _state+0, 0
L__main79:
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;Lab11.c,78 :: 		PW1 = val;
	MOVF       _val+0, 0
	MOVWF      _PW1+0
	MOVF       _val+1, 0
	MOVWF      _PW1+1
;Lab11.c,79 :: 		Lcd_Chr_CP(PW1 + '0');
	MOVLW      48
	ADDWF      _val+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Lab11.c,80 :: 		state = 1;
	MOVLW      1
	MOVWF      _state+0
	MOVLW      0
	MOVWF      _state+1
;Lab11.c,81 :: 		} else if (state == 1) {
	GOTO       L_main29
L_main28:
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      1
	XORWF      _state+0, 0
L__main80:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;Lab11.c,82 :: 		PW2 = val;
	MOVF       _val+0, 0
	MOVWF      _PW2+0
	MOVF       _val+1, 0
	MOVWF      _PW2+1
;Lab11.c,83 :: 		Lcd_Chr_CP(PW2 + '0');
	MOVLW      48
	ADDWF      _val+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Lab11.c,84 :: 		number1 = PW1 * 10 + PW2;
	MOVF       _PW1+0, 0
	MOVWF      R0+0
	MOVF       _PW1+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       _PW2+0, 0
	ADDWF      R0+0, 0
	MOVWF      _number1+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _PW2+1, 0
	MOVWF      _number1+1
;Lab11.c,85 :: 		state = 2;
	MOVLW      2
	MOVWF      _state+0
	MOVLW      0
	MOVWF      _state+1
;Lab11.c,86 :: 		} else if (state == 3) {
	GOTO       L_main31
L_main30:
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      3
	XORWF      _state+0, 0
L__main81:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;Lab11.c,87 :: 		PW4 = val;
	MOVF       _val+0, 0
	MOVWF      _PW4+0
	MOVF       _val+1, 0
	MOVWF      _PW4+1
;Lab11.c,88 :: 		Lcd_Chr_CP(PW4 + '0');
	MOVLW      48
	ADDWF      _val+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Lab11.c,89 :: 		state = 4;
	MOVLW      4
	MOVWF      _state+0
	MOVLW      0
	MOVWF      _state+1
;Lab11.c,90 :: 		} else if (state == 4) {
	GOTO       L_main33
L_main32:
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      4
	XORWF      _state+0, 0
L__main82:
	BTFSS      STATUS+0, 2
	GOTO       L_main34
;Lab11.c,91 :: 		PW5 = val;
	MOVF       _val+0, 0
	MOVWF      _PW5+0
	MOVF       _val+1, 0
	MOVWF      _PW5+1
;Lab11.c,92 :: 		Lcd_Chr_CP(PW5 + '0');
	MOVLW      48
	ADDWF      _val+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Lab11.c,93 :: 		number2 = PW4 * 10 + PW5;
	MOVF       _PW4+0, 0
	MOVWF      R0+0
	MOVF       _PW4+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       _PW5+0, 0
	ADDWF      R0+0, 0
	MOVWF      _number2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _PW5+1, 0
	MOVWF      _number2+1
;Lab11.c,94 :: 		state = 5;
	MOVLW      5
	MOVWF      _state+0
	MOVLW      0
	MOVWF      _state+1
;Lab11.c,95 :: 		}
L_main34:
L_main33:
L_main31:
L_main29:
;Lab11.c,96 :: 		}
L_main27:
;Lab11.c,99 :: 		if ((val == '+' || val == '-' || val == '*' || val == '/') && state == 2) {
	MOVLW      0
	XORWF      _val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      43
	XORWF      _val+0, 0
L__main83:
	BTFSC      STATUS+0, 2
	GOTO       L__main57
	MOVLW      0
	XORWF      _val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      45
	XORWF      _val+0, 0
L__main84:
	BTFSC      STATUS+0, 2
	GOTO       L__main57
	MOVLW      0
	XORWF      _val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      42
	XORWF      _val+0, 0
L__main85:
	BTFSC      STATUS+0, 2
	GOTO       L__main57
	MOVLW      0
	XORWF      _val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVLW      47
	XORWF      _val+0, 0
L__main86:
	BTFSC      STATUS+0, 2
	GOTO       L__main57
	GOTO       L_main39
L__main57:
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      2
	XORWF      _state+0, 0
L__main87:
	BTFSS      STATUS+0, 2
	GOTO       L_main39
L__main56:
;Lab11.c,100 :: 		PW3 = val;
	MOVF       _val+0, 0
	MOVWF      _PW3+0
	MOVF       _val+1, 0
	MOVWF      _PW3+1
;Lab11.c,101 :: 		Lcd_Chr_CP(PW3); // show operator
	MOVF       _val+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Lab11.c,102 :: 		state = 3;
	MOVLW      3
	MOVWF      _state+0
	MOVLW      0
	MOVWF      _state+1
;Lab11.c,103 :: 		}
L_main39:
;Lab11.c,106 :: 		if (val == '=' && state == 5) {
	MOVLW      0
	XORWF      _val+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVLW      61
	XORWF      _val+0, 0
L__main88:
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main89
	MOVLW      5
	XORWF      _state+0, 0
L__main89:
	BTFSS      STATUS+0, 2
	GOTO       L_main42
L__main55:
;Lab11.c,107 :: 		switch (PW3) {
	GOTO       L_main43
;Lab11.c,108 :: 		case ADD:      Answer = number1 + number2; break;
L_main45:
	MOVF       _number2+0, 0
	ADDWF      _number1+0, 0
	MOVWF      _Answer+0
	MOVF       _number1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _number2+1, 0
	MOVWF      _Answer+1
	MOVLW      0
	BTFSC      _Answer+1, 7
	MOVLW      255
	MOVWF      _Answer+2
	MOVWF      _Answer+3
	GOTO       L_main44
;Lab11.c,109 :: 		case SUBTRACT: Answer = number1 - number2; break;
L_main46:
	MOVF       _number2+0, 0
	SUBWF      _number1+0, 0
	MOVWF      _Answer+0
	MOVF       _number2+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _number1+1, 0
	MOVWF      _Answer+1
	MOVLW      0
	BTFSC      _Answer+1, 7
	MOVLW      255
	MOVWF      _Answer+2
	MOVWF      _Answer+3
	GOTO       L_main44
;Lab11.c,110 :: 		case MULTIPLY: Answer = number1 * number2; break;
L_main47:
	MOVF       _number1+0, 0
	MOVWF      R0+0
	MOVF       _number1+1, 0
	MOVWF      R0+1
	MOVF       _number2+0, 0
	MOVWF      R4+0
	MOVF       _number2+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _Answer+0
	MOVF       R0+1, 0
	MOVWF      _Answer+1
	MOVLW      0
	BTFSC      _Answer+1, 7
	MOVLW      255
	MOVWF      _Answer+2
	MOVWF      _Answer+3
	GOTO       L_main44
;Lab11.c,111 :: 		case DIVISION:
L_main48:
;Lab11.c,112 :: 		if (number2 != 0)
	MOVLW      0
	XORWF      _number2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main90
	MOVLW      0
	XORWF      _number2+0, 0
L__main90:
	BTFSC      STATUS+0, 2
	GOTO       L_main49
;Lab11.c,113 :: 		Answer = number1 / number2;
	MOVF       _number2+0, 0
	MOVWF      R4+0
	MOVF       _number2+1, 0
	MOVWF      R4+1
	MOVF       _number1+0, 0
	MOVWF      R0+0
	MOVF       _number1+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Answer+0
	MOVF       R0+1, 0
	MOVWF      _Answer+1
	MOVLW      0
	BTFSC      _Answer+1, 7
	MOVLW      255
	MOVWF      _Answer+2
	MOVWF      _Answer+3
	GOTO       L_main50
L_main49:
;Lab11.c,115 :: 		Answer = 0; // handle divide by zero
	CLRF       _Answer+0
	CLRF       _Answer+1
	CLRF       _Answer+2
	CLRF       _Answer+3
L_main50:
;Lab11.c,116 :: 		break;
	GOTO       L_main44
;Lab11.c,117 :: 		}
L_main43:
	MOVLW      0
	XORWF      _PW3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVLW      43
	XORWF      _PW3+0, 0
L__main91:
	BTFSC      STATUS+0, 2
	GOTO       L_main45
	MOVLW      0
	XORWF      _PW3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVLW      45
	XORWF      _PW3+0, 0
L__main92:
	BTFSC      STATUS+0, 2
	GOTO       L_main46
	MOVLW      0
	XORWF      _PW3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main93
	MOVLW      42
	XORWF      _PW3+0, 0
L__main93:
	BTFSC      STATUS+0, 2
	GOTO       L_main47
	MOVLW      0
	XORWF      _PW3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      47
	XORWF      _PW3+0, 0
L__main94:
	BTFSC      STATUS+0, 2
	GOTO       L_main48
L_main44:
;Lab11.c,119 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Lab11.c,120 :: 		Lcd_Out(1, 1, "Answer =");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Lab11+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab11.c,121 :: 		IntToStr(Answer, answerx);
	MOVF       _Answer+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _Answer+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _answerx+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Lab11.c,122 :: 		Lcd_Out(2, 1, answerx);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _answerx+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Lab11.c,125 :: 		while (1) {
L_main51:
;Lab11.c,126 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
	CLRF       _kp+1
;Lab11.c,127 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	NOP
	NOP
;Lab11.c,128 :: 		if (kp == 1) break; // Press key 1 (e.g., mapped as C) to clear
	MOVLW      0
	XORWF      _kp+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVLW      1
	XORWF      _kp+0, 0
L__main95:
	BTFSS      STATUS+0, 2
	GOTO       L_main54
	GOTO       L_main52
L_main54:
;Lab11.c,129 :: 		}
	GOTO       L_main51
L_main52:
;Lab11.c,131 :: 		ResetCalculator();
	CALL       _ResetCalculator+0
;Lab11.c,132 :: 		}
L_main42:
;Lab11.c,133 :: 		}
	GOTO       L_main0
;Lab11.c,134 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
