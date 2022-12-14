#ifndef TASK_DATA_H
#define	TASK_DATA_H

typedef struct task {
        volatile int ticks_left;
        int ticks_period;
        void (*run)(void);
    } task_t;

char taskData_getADC_ready(void);
void taskData_setADC_ready(char value);
void taskData_set_ADC_CurrentTask(char value);
char taskData_get_ADC_CurrentTask(void);
void taskData_set_Humidity(int value);
void taskData_set_Temperature(int value);
int taskData_get_MaxNoise(void);
void taskData_set_MaxNoise(int value);
int taskData_get_Temperature(void);
int taskData_get_Humidity(void);

#endif	

