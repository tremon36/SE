#include <xc.h>
#include "taskData.h"

void readHumidity(void){
    ADCON0bits.CHS = 0b0000; // ADC channel = HumiditySensor @TODO
    
    while(taskData_getADC_ready() == 0); // wait for ADC
    taskData_setADC_ready(0);            // ADC is now busy        
    taskData_set_ADC_CurrentTask(0); // humidity is adc task 0
    
    INTCONbits.T0IF = 0;
    TMR0 = 231;
    while(INTCONbits.T0IF == 0);        //wait 4.67uS
    
    ADCON0bits.GO=1; // start measurement
}

void readTemperature(void){
    ADCON0bits.CHS = 0b0001; // ADC channel = TemperatureSensor @TODO
    
    while(taskData_getADC_ready() == 0); // wait for ADC
    taskData_setADC_ready(0);            // ADC is now busy        
    taskData_set_ADC_CurrentTask(1); // temperature is adc task 1
    
    INTCONbits.T0IF = 0;
    TMR0 = 231;
    while(INTCONbits.T0IF == 0);        //wait 4.67uS
    
    ADCON0bits.GO=1; // start measurement
}

void readNoise(void){
    ADCON0bits.CHS = 0b0010; // ADC channel = NoiseSensor @TODO
    
    while(taskData_getADC_ready() == 0); // wait for ADC
    taskData_setADC_ready(0);            // ADC is now busy        
    taskData_set_ADC_CurrentTask(2); // noise is ADC task 2
    
    INTCONbits.T0IF = 0;
    TMR0 = 231;
    while(INTCONbits.T0IF == 0);        //wait 4.67uS
    
    ADCON0bits.GO=1; // start measurement
}

void setPWMDuty(void){
	taskData_set_DutyPWM((taskData_get_DutyPWM()*PR2)/100);
}

void sendUsartData(void){

 //Humidity Temperature max_noise Duty
 
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_Humidity()));
    while(!TRMT);
    TRMT=0;
    TXREG=(char)(0x0000FF & (taskData_get_Humidity() >> 8));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_Humidity() >> 16));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_Humidity() >> 24));

    //Send Temperature Data

    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_Temperature()));
    while(!TRMT);
    TRMT=0;
    TXREG=(char)(0x0000FF & (taskData_get_Temperature() >> 8));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_Temperature() >> 16));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_Temperature() >> 24));

    //Send MaxNoise Data

    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_MaxNoise()));
    while(!TRMT);
    TRMT=0;
    TXREG=(char)(0x0000FF & (taskData_get_MaxNoise() >> 8));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_MaxNoise() >> 16));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_MaxNoise() >> 24));
    taskData_set_MaxNoise(0);

    //Send Duty

    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_DutyPWM()));
    while(!TRMT);
    TRMT=0;
    TXREG=(char)(0x0000FF & (taskData_get_DutyPWM() >> 8));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_DutyPWM() >> 16));
    while(!TRMT);
    TRMT=0;
    TXREG= (char)(0x0000FF & (taskData_get_DutyPWM() >> 24));
}

char spi_write_read(char one_byte){
    char x;
    char answer, x;
    
    answer = 0;
    
    for(x = 8; x > 0; x--){
        spi_dat_out = (__bit)((one_byte >> (x - 1)) & 0b00000001);
		
        //__delay_us(5);
        spi_clk = 1;
		
        //__delay_us(10);
        answer |= (char)spi_dat_in;
        spi_clk = 0;
		
        //__delay_us(10);
        if(x > 1)
            answer = answer << 1;
    }
    return answer;
}

