clear;
clc;
N = 50;
% probabilty of alive cells to begin with
prob = 0.3;
% use N+2 to make the edge of the grid zero
A = zeros(N+2, N+2);
A(2:N+1, 2:N+1) = rand(N);
G = (A < prob);
for i = 1:50
    A = zeros(N+2, N+2);
    for row = 2:N+1
       for col = 2:N+1
           % diagonal neighbors
           tri = G(row-1, col-1)+G(row-1, col+1)+G(row+1, col-1)+G(row+1, col+1);
           % nearest neighbors
           dir = G(row-1, col)+G(row, col-1)+G(row, col+1)+G(row+1, col);
           % number of alive neighbor/s
           n = tri + dir;
           % if a live cell has less than 2 or more than 3 neighbors
           % cell should be dead due to under/over-population
           if (G(row, col)== 1) && ((n < 2) || (n > 3))
               A(row, col) = 0;
           % if a live cell has 2 or 3 alive neighbors, stays alive
           elseif (G(row, col)== 1) && ((n == 2) || (n == 3))
               A(row, col) = 1;
           % if a dead cell has three alive neighbors, it becomes alive 
           % in the next generation as if repopulation
           elseif (G(row, col)== 0) && (n == 3)
               A(row, col) = 1;
           end

       end
       %pause(0.001);
       %spy(G)

    end
    G = A;
    pause(0.1)
    % spy(S,'LineSpec',markersize)
    spy(G, '.', 10)
    drawnow
end