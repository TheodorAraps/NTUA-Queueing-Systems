pkg load statistics

clc;
clear all;
close all;

# Διαδικασία Καταμέτρησης Poisson
# Task Α

N = 100;                # Number of successive events
lambda = 5;
mean = 1/lambda;
succ_events = exprnd(mean, 1, N);
sum_succ_events = succ_events;

for i = 1 : (N - 1)
  sum_succ_events(1, i+1) = sum_succ_events(1, i) + succ_events(1, i+1);
endfor

y = 1 : N;
stairs(sum_succ_events(1,:), y);
xlabel("t");
ylabel("N(t)");

