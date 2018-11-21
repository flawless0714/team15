#include <stdio.h>
#include <time.h>
#include <stdlib.h>


#include "clock.h"


typedef double data_t;

double *create_double_array(unsigned long size)
{
    srand((unsigned int)time(NULL));
    double *array = malloc(size * sizeof(double));
    
    if (!array)
        return 0;

    for (unsigned long i = 0; i < size; i++)
        array[i] = (float) rand() / (float)(RAND_MAX/ 100);

    return array;
}

float inner4(double *u, double *v, long length)
{
    long i;
    double sum = 0; 
    double *udata = u;
    double *vdata = v;
    double cyc =0;
    start_comp_counter();
    for (i = 0; i < length; i++) {
      sum = sum + udata[i] * vdata[i];
    }
    cyc = get_comp_counter();
    
    float CPE = cyc/length;
   
    printf("For %ld-Dimensional Vector Dot Product. Cycle = %f\n", length, cyc);
    printf("CPE = %f\n", CPE);
    
    return cyc;    
}


int main(){


    FILE *f = fopen("file.txt", "w");
    if (f == NULL)  
    {
        printf("Error opening file!\n");
        exit(1);
    }    
    unsigned long eachTimes = 10; // test each vector dot product 10 times
    unsigned long dimRange  = 1000; // test dimension to 1000 
    
    for(unsigned long i = 1; i <= dimRange; i++ ){
        unsigned long long  total_cycle  = 0;
        for(unsigned long j = 1; j <= eachTimes; j++){
            
            double *u = create_double_array(i);
            double *v = create_double_array(i);
            total_cycle = total_cycle + (long)inner4( u, v, i);
            free(u);
            free(v);
        }
        total_cycle = total_cycle/eachTimes;
        fprintf(f,"%lu %llu\n", i, total_cycle);
    }
    fclose(f);

    
    
    return 0;
}
