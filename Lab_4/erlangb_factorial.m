function P_blocking = erlangb_factorial(r, c)
  denominator = 0;
  numerator = power(r, c) / factorial(c);
  
  for k = 0 : c
    denominator = denominator + (power(r, k) / factorial(k));
  endfor
  
  P_blocking = 100 * (numerator / denominator);
  printf("(Factorial Method) The probability of rejecting a client when r = %d snd c = %d is: %f%%\n", r, c, P_blocking)
endfunction
