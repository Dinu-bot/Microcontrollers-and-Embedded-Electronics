#line 1 "D:/DINU UNI/UOK/Academic/Year 3/sem 1/Microcontrollers and Embedded Electronics Laboratory/EXP 8 files/project files/MyProject.c"


void main() {
 unsigned short duty_cycle;


 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;


 PWM1_Init(5000);
 PWM1_Start();


 while(1){
 for (duty_cycle=0 ; duty_cycle <=255; duty_cycle +=5){
 PWM1_Set_Duty(duty_cycle);
 Delay_ms(30);
 }
 for (duty_cycle=255;duty_cycle >=0;duty_cycle -=5){
 PWM1_Set_Duty(duty_cycle);
 Delay_ms(30);
 }


 }

}
