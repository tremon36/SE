#include <xc.h>

char adc_ready = 1;
char adc_current_task = 0;
int humidity = 0;
int temperature = 0;
int max_noise = 0;
int duty = 0;
char leds = 0;

char taskData_getADC_ready(void){
    return adc_ready;
}
void taskData_setADC_ready(char value){
    adc_ready = value;
}
void taskData_set_ADC_CurrentTask(char value){
    adc_current_task = value;
}
char taskData_get_ADC_CurrentTask(void){
    return adc_current_task;
}
void taskData_set_Humidity(int value){
    humidity = value;
}
void taskData_set_Temperature(int value){
    temperature = value;
}
int taskData_get_MaxNoise(void){
    return max_noise;
}
void taskData_set_MaxNoise(int value){
    max_noise = value;
}
void taskData_get_DutyPWM(void){
    return duty;
}
int taskData_set_DutyPWM(int value){
    duty = value;
}
int taskData_get_Temperature(void){
    return temperature;
}
int taskData_get_Humidity(void){
    return humidity;
}
void taskData_get_LedsValue(){
    return leds;
}
char taskData_set_LedsValue(char value){
    leds = value;
}

