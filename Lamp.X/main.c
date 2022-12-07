#include <xc.h>
#include "tasks.h"
#include "taskData.h"
#include "ISR.h"
#include "hardware.h"

#define TASK_AMOUNT 3
task_t task_array[8];

task_t create_task(int ticks_period,void(*run)(void)){
    task_t to_create;
    to_create.ticks_left = ticks_period;
    to_create.ticks_period = ticks_period;
    to_create.run = run;
    return to_create;
}

void __interrupt() MAIN_ISR(void){
    if(PIR1bits.TMR1IF == 1) ISR_periodic_interrupt(task_array,TASK_AMOUNT);
    else if(PIR1bits.ADIF==1) ISR_ADC_lecture_ready();
    
}

void main(void) {
    initHardware();
    
    // task declaration should use 96 bytes of 368 bytes available RAM
    // each tick is 10 ms
    
    task_array[0] = create_task(1,readNoise); // noise period = 10ms
    //task_array[1] = create_task(500,readCO2); // CO2, temp, etc period = 5s
    task_array[1] = create_task(500,readTemperature);
    task_array[2] = create_task(500,readHumidity);
    //task_array[4] = create_task(500,readLight);
    //task_array[5] = create_task(500,sendUsartData);
    
    // set tasks period is 50 ms (arbitrary decision)
    
    //task_array[6] = create_task(5,setPWMduty);
    //task_array[7] = create_task(5,setLedsValue);
    
    // MAIN SCHEDULER LOOP
    
    for(;;) {
        for(char i = 0; i < TASK_AMOUNT; i++){
            if(task_array[i].ticks_left <= 0){
                task_array[i].run();
                task_array[i].ticks_left = task_array[i].ticks_period;
            }
        }
    }
    
}
