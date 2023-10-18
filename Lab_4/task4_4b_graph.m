clc;
clear all;
close all;

# Task 4 
#(4)(?)

r = 200 * (23/60);
c = 1 : 200;
P_blocking = zeros(1, 200);

for i = 1 : 200
  P_blocking(i) = erlangb_iterative(r, i);
endfor

plot(c, P_blocking, "b", "linewidth", 1.3)
xlabel("Number of serving lines")
ylabel("P[blocking]")
title("Probability of rejecting a client to number of lines/servers")

# Task 4 
#(4)(?)
i = find(P_blocking < 1, 1);
printf("P[blocking] is less than 1%% for %d serving lines\n", i - 1)
