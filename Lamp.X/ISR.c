#include <xc.h>
#include "taskData.h"

void ISR_ADC_lecture_ready(void){
    PIR1bits.ADIF=0;
    taskData_setADC_ready(1); // ADC is now free
    int lecture = 0;
    switch(taskData_get_ADC_CurrentTask()){
        case 0:
            taskData_set_Humidity((int)ADRESH << 8 | (int)ADRESL);
            break;
        case 1:    
            taskData_set_Temperature((int)ADRESH << 8 | (int)ADRESL);
            break;
        case 2:
            lecture = (int)ADRESH << 8 | (int)ADRESL;
            if(lecture > taskData_get_MaxNoise()){
                taskData_set_MaxNoise(lecture);
            }
            break;          
    }
}

void ISR_periodic_interrupt(task_t* task_array,char task_amount){
    //load timer 1 with 15536 = 3CB0
    PIR1bits.TMR1IF = 0;
    TMR1L = 0xB0;
    TMR1H = 0x3C;
    
    for(char i = 0; i < task_amount;i++){
        task_array[i].ticks_left--;
    }
}
