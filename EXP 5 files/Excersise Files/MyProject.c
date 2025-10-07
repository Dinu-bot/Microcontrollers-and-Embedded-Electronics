sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

char txt1[] = "********";
char i;
int pos1;

void Move_Delay() {
  Delay_ms(100);
}
void main(){
  CCP1CON = 0x00;
  T1CON = 0x00;
  VRCON = 0x00;
  INTCON = 0x00;
  CMCON = 0x07;

  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Delay_ms(10);
  Lcd_Out(1,1,txt1);
  Move_Delay();

  while(1) {
          pos1=5;
        // Move outward
        for(i = 1; i < 17; i++) {
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,i,txt1);
          Move_Delay();
        }

        // Move inward
        for(i = 16; i > 0; i--) {
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(2,i,txt1);
          Move_Delay();
        }

        for(i = 0; i < 1; i++) {
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,i,txt1);
          Move_Delay();
        }
      }
}