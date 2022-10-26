#pragma config CPD = OFF, BOREN = OFF, IESO = OFF, DEBUG = OFF, FOSC = HS
#pragma config FCMEN = OFF, MCLRE = ON, WDTE = OFF, CP = OFF, LVP = OFF
#pragma config PWRTE = ON, BOR4V = BOR21V, WRT = OFF

#pragma intrinsic(_delay)
#define _XTAL_FREQ 20000000 // necessary for __delay_us

#include <xc.h>

char interruption_counter = 0;
char up_down_state = 0;

void init_TMR0(void) {

    INTCONbits.T0IE = 1;
    INTCONbits.GIE = 1;
    OPTION_REGbits.T0CS =0;
    OPTION_REGbits.PSA =0;
    OPTION_REGbits.PS = 0b110;

}

void init_TMR2(void) {

    PR2 = 166;
    T2CONbits.T2CKPS = 0b00;
    PIE1bits.TMR2IE = 0;
    T2CONbits.TMR2ON = 1;

}

void init_PWM(void) {

    CCP1CONbits.P1M = 0b00;
    CCP1CONbits.CCP1M = 0b1100;
    CCP2CONbits.CCP2M = 0b1100;
    // @TODO configurar puerto (no se como se hace)
    CCPR1L = 0;
    CCPR2L = 166;
    init_TMR2();
}

void __interrupt() TRAT_INT(void) {

    if(INTCONbits.T0IF){
        TMR0 = 60;
        interruption_counter += 1;
        if(interruption_counter == 10){ // Contar hasta 10 porque 5 * 10 = 50
            interruption_counter = 0;
            if(up_down_state == 0) {
                CCPR1L += 1;
                CCPR2L -= 1;
                if(CCPR1L == 0) up_down_state = 1;
            } else {
                CCPR1L -= 1;
                CCPR2L += 1;
                if(CCPR1L == 166) up_down_state = 0;
            }
        }
        INTCONbits.T0IF = 0;
    }

}


void main(void)
{

  OSCCONbits.OSTS = 1; // External cristal
  init_TMR0();
  init_PWM();

  while(1);


}
