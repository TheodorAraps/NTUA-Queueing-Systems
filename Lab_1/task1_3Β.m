pkg load statistics

clc;
clear all;
close all;

# Διαδικασία Καταμέτρησης Poisson
# Task Β

N = [100,  200, 300, 500, 1000, 10000];                # Number of successive events
lambda = 5;
mean = 1/lambda;

for i = 1 : columns(N)
  succ_events = exprnd(mean, 1, N(i));                 # random samples
  sum_succ_events = succ_events;
  for j = 1 : (N(i)-1)
    sum_succ_events(1, j+1) = sum_succ_events(1, j) + succ_events(1, j+1);
  endfor

   mean_succ_events = N(i)/sum_succ_events(1, N(i));    # means
   printf("Mean number of successive events for N = %d in a time period T is: %f \n", N(i), mean_succ_events)
endfor

