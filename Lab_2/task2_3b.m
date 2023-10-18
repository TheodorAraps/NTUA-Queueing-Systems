% system M/M/1/4
% when there are 3 clients in the system, the capability of the server doubles.

clc;
clear all;
close all;

# ?????????? ????????? ??????? (birth-death process): ???????? ?? ??????? ?/?/1/?
# Task b
 
lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

# (i)

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
printf("The Transition Matrix of our M/M/1/4 system is: \n");
transition_matrix

# (ii)

% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
printf("The ergodic probabilities of our system are: \n");
probabilities = 100 * P # values in %

% plot the ergodic probabilities (bar for bar chart)
figure(1);
bar(states, P, "r", 0.5);

# (iii)

E_nt = sum((1+states).*P);
printf("The Mean number of clients in our system in equilibrium is: E[n(t)] = %d clients\n", E_nt);

# (iv)

p_blocking = 100 * P(columns(P));
printf("The blocking possibility is: P[blocking] = %f %% \n", p_blocking)

# (v)



% transient probability of state 0 until convergence to ergodic probability. Convergence takes place P0 and P differ by 0.01
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);       # state 0
  Prob1(index) = P0(2);       # state 1
  Prob2(index) = P0(3);       # state 2
  Prob3(index) = P0(4);       # state 3
  Prob4(index) = P0(5);       # state 4
  if P0 - P < 0.01 
    break;
  endif
endfor

T = 0 : 0.01 : T;
figure(2);
colors = "mrkbg";
hold on
title("Time dependency of each state's Probability")
plot(T, Prob0, colors(1), "linewidth", 1.3);
plot(T, Prob1, colors(2), "linewidth", 1.3);
plot(T, Prob2, colors(3), "linewidth", 1.3);
plot(T, Prob3, colors(4), "linewidth", 1.3);
plot(T, Prob4, colors(5), "linewidth", 1.3);
xlabel("Time");
ylabel("Probability");
legend("State 0", "State 1", "State 2", "State 3", "State 4");
hold off