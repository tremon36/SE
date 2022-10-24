
#include <proc/pic16f886.h>

#pragma config CPD = OFF, BOREN = OFF, IESO = OFF, DEBUG = OFF, FOSC = HS
#pragma config FCMEN = OFF, MCLRE = ON, WDTE = OFF, CP = OFF, LVP = OFF
#pragma config PWRTE = ON, BOR4V = BOR21V, WRT = OFF
#pragma intrinsic(_delay)
#define _XTAL_FREQ 20000000 // necessary for __delay_us
#include <xc.h>
#include <stdio.h>

int adcread;
char continuar;
char x;
char interruption_counter = 0;

void init_TMR0(void)
{
INTCONbits.T0IE = 1;
OPTION_REGbits.T0CS =0;
OPTION_REGbits.PSA =0;
OPTION_REGbits.PS = 0b110;
}
void __interrupt() TRAT_INT(void)
{
    if(INTCONbits.T0IF){
        TMR0 = 60;
        interruption_counter += 1;
        if(interruption_counter == 100){ // Contar hasta 100 porque 5 * 100 = 500
            
            interruption_counter = 0;
            x += 1;
            ADCON0bits.GO=1;
            }
        
        INTCONbits.T0IF = 0;
    }
    else{
        PIR1bits.ADIF=0;
        PORTB = ADRESL;
        adcread = (int)ADRESH << 8 | (int)ADRESL;
        continuar = 1;
    }
}
void init_uart(void)
{ 
TXSTAbits.BRGH = 1;
BAUDCTLbits.BRG16 = 0;
// SPBRGH:SPBRG = 
SPBRG = 129; // 9600 baud rate with 20MHz Clock

TXSTAbits.SYNC = 0; /* Asynchronous */
TXSTAbits.TX9 = 0; /* TX 8 data bit */
RCSTAbits.RX9 = 0; /* RX 8 data bit */
PIE1bits.TXIE = 0; /* Disable TX interrupt */
PIE1bits.RCIE = 0; /* Disable RX interrupt */
RCSTAbits.SPEN = 1; /* Serial port enable */
TXSTAbits.TXEN = 0; /* Reset transmitter */
TXSTAbits.TXEN = 1; /* Enable transmitter */

TXREG = 0;

}
void init_adc(void)
 {
    TRISB=0;
    TRISAbits.TRISA0=1;
    ANSELbits.ANS0=1;
    ADCON0bits.ADCS0=0;
    ADCON0bits.ADCS1=1;
    ADCON1bits.VCFG0=0;
    ADCON1bits.VCFG1=0;
    ADCON0bits.CHS=0b0000;
    ADCON1bits.ADFM=1;
    ADCON0bits.ADON=1;
    PIE1bits.ADIE=1; 
 }

void putch(char c)
{ 
    while(!TRMT)
        continue;
        TXREG = c;
} 

void main(void)
{
    OSCCONbits.OSTS = 1; // External cristal
    init_adc();
    init_uart();
    init_TMR0();
    INTCONbits.PEIE=1;
    INTCONbits.GIE = 1;

    x = 0;
   
    continuar=0;
    while(1){
      
      while(!continuar);
      continuar=0;
      printf("Resultado: %d \r\n", adcread);
  }
}