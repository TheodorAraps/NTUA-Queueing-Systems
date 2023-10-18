function P_blocking = erlangb_iterative(r, c)
  B = ones(1, c + 1); 
  for i = 2 : (c + 1)
    numerator = r * B(i - 1);
    denominator = numerator + (i - 1);
    B(i) = numerator / denominator;
  endfor
  P_blocking = 100 * B(c + 1);
  printf("(Iterative Method) The probability of rejecting a client when r = %d and c = %d is: %f%%\n", r, c, P_blocking)
endfunction

