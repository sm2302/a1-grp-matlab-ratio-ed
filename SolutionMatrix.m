%% Conway Game of Life
% To start make the size of the game (50,50)
% Compute the number of neighbours
% Then draw the dot using spy function

clc;
clear;
N = 50; 
A = round(rand(N,N));
newlife = A;
for a = 1:N
    si = a-1;
    ei = a+1;
    veci = si:ei;
    veci(veci==0)=N;
    veci(veci==N+1)=1;
    for b = 1:N
      sj = b-1;
      ej = b+1;
      vecj = sj:ej;
      vecj(vecj==0)=N;
      vecj(vecj==N+1)=1;
      n = sum(sum(A(veci,vecj)))-A(a,b); % number of neighbour
      if A(a,b)
          % Any live cell with fewer than two live neighbours dies by under-population.
          if (A(a, b)== 1) && ((n < 2) || (n > 3))
              newlife(a,b) = 0;
          
          % Any live cell with two or three live neighbours lives on to the next generation.

          % Any live cell with more than three live neighbours dies by overcrowding.
          elseif (A(a, b)== 1) && ((n == 2) || (n == 3))
              newlife(a,b) = 1;
      
          % Any dead cell with exactly three live neighbours becomes a live cell by reproduction.
          elseif (mylife(a, b)== 0) && (n == 3)
              newlife(a,b) = 1;
          end
      end
    end

  A = newlife;
  pause(0.01)
  spy(A)
  grid on
end



