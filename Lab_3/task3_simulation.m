# Simulation of a M/M/1/10 system

clc;
clear all;
close all;

lambdas = [1, 5, 10];
mu = 5;
final_state = 10;
states = 0 : 1 : 10;

for l = 1 : length(lambdas)
  rand("seed", 1); 
  printf("********** LAMBDA = %d ARRIVALS PER MINUTE **********\n", lambdas(l));
  arrivals = zeros(1, final_state + 1);
  total_arrivals = 0;
  index = 0;
  transitions = 0;
  current_state = 0;
  previous_mean_clients = 0;
  threshold = lambdas(l)/(lambdas(l) + mu);
  arrival_counter = 0;

  while transitions >= 0
    transitions = transitions + 1;  
  
    if mod(transitions,1000) == 0       
      index = index + 1;
      for i=1:length(arrivals)
          P(i) = arrivals(i)/total_arrivals;    
      endfor
    
      mean_clients = 0;  
    
      for i=1:1:length(arrivals)
        mean_clients = mean_clients + (i-1).*P(i);
      endfor
    
      to_plot(index) = mean_clients;
        
      if abs(mean_clients - previous_mean_clients) < 0.00001 || (transitions > 1000000)
        break;
      endif
     
      previous_mean_clients = mean_clients;
    
    endif
   
    random_number = rand(1);        
  
    # Debugging (1)
#      if transitions <= 30
#        printf("\n******* TRANSITION %d *******\n", transitions);
#        printf("Current state: %d\n", current_state);
#       if (current_state == final_state) && (random_number < threshold)
#          printf("Either a client was declined or the system reached the final state!\n");
#        elseif (current_state == 0) || ((random_number < threshold) && (current_state != final_state))
#          current_state = current_state + 1;
#          arrival_counter = arrival_counter + 1;
#          printf("The next transition is an arrival. \n");
#          printf("The total number of arrivals until now is: %d\n", arrival_counter);
#        else
#          current_state = current_state - 1;
#          printf("The next transition is a departure.\n");
#          printf("The total number of arrivals until now is: %d\n", arrival_counter);
#        endif
#      endif
      
       
    if ((current_state == 0) || ((random_number < threshold) && (current_state != final_state)))   # Arrival
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; 
      current_state = current_state + 1;
    elseif (current_state == final_state) && (random_number < threshold) # Final state
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
    elseif random_number >= threshold          # Departure case
      current_state = current_state - 1;
    endif

  endwhile

  for i = 1 : length(arrivals)
    P_percent(i) = P(i) * 100;
    printf("The ergodic probability of the state %d is: %g%% \n", (i - 1), P_percent(i))
  endfor

  printf("The chance of rejecting a client is: %f%%\n", P_percent(final_state + 1))
  printf("The mean number of clients in the system is: %f \n", mean_clients);
  mean_delay = mean_clients/(lambdas(l)*(1 - P(final_state + 1))); 
  printf("The mean delay time of a client in the system (Little Law) is: %f minutes \n \n", mean_delay);
  
  figure(l);
  plot(to_plot,"b","linewidth",1.3);
  title("Average number of clients in the M/M/1/10 queue ");
  xlabel("Transitions in thousands");
  ylabel("Average number of clients");

  figure(l + 3);
  bar(states, P, 'g', 0.4);
  title("Ergodic probabilities of each state");
  xlabel("State");
  ylabel("Probabilities");

  for i = 1 : index
     to_plot(i) = 0;
  endfor
 
endfor
