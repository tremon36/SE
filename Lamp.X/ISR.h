#ifndef ISR_H
#define ISR_H
void ISR_ADC_lecture_ready(void);
void ISR_periodic_interrupt(task_t* task_array,char task_amount);
#endif