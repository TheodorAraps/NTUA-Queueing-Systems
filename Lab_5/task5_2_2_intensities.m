# Task 5 
# ??????? ?????? ????? ????????
# (2)

clc;
clear all;
close all;

function [v1,v2,v3,v4,v5] = intensities(l1,l2,m1,m2,m3,m4,m5)
  ergodic = [0, 0, 0 ,0, 0];
  v1 = l1./m1;
  if(v1 < 1)
    ergodic(1) = 1;
  endif
  v2 = (l2 + (2/7) .* l1)./m2;
  if(v2 < 1)
    ergodic(2) = 1;
  endif
  v3 = ((4/7) * l1)/m3;
  if(v3 < 1)
    ergodic(3) = 1;
  endif
  v4 = ((1/7) .* l1 + (1/2) .* ((4/7) .* l1)) ./ m4;
  if(v4 < 1)
    ergodic(4) = 1;
  endif
  v5 = ((l2 + (2/7) .* l1) + (1/2) .* ((4/7) .* l1))./m5;
  if(v5 < 1)  
    ergodic(5) = 1;
  endif
  for i = ergodic
    if (i == 0)  
      printf("Non-Ergodic System (0)\n");
      break;
    endif
  endfor
  if(i)
    printf("Ergodic System (1)\n");
  endif
endfunction  