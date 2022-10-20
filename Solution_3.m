
A = round(rand(10));

 %size of the matrix

[m_len, n_len] = size(A);
mylife = A;
disp(mylife)
% subMatix
B = ones(3,3); 

for i = 2 : (m_len-1)
    for j = 2 : (n_len-1)
% Counting number of nearest neighbourhood
count = B(1,1)*A(i-1,j-1) + B(1,2)*A(i-1,j) + B(1,3)*A(i-1,j+1) + B(2,1)*A(i,j-1) + B(2,2)*A(i,j) + B(2,3)*A(i,j+1) + B(3,1)*A(i+1,j-1) + B(3,2)*A(i+1,j) + B(3,3)*A(i+1,j+1) - A(i,j);
% if less than 2 neighbours are live, then live cell will be dead
%by underpopulation rule
        if (A(i,j) == 1 && count < 2)
           mylife(i,j) = 0;
        end
% if exactly 2 or 3 neighbouts are live, then live cell will move
%to next generation rule
        if (A(i,j) == 1 && count == 2 || count == 3 )
           mylife(i,j) = 1;
        end
% if more than 3 neighbours are live, then live cell will be dead
%due to overpopulation rule
        if (A(i,j) == 1 && count > 3)
           mylife(i,j) = 0;
        end
% Any dead Cell will become live when exactly 3 neighbours are live
%like reproduction rule
        if (A(i,j) == 0 && count == 3)
           mylife(i,j) = 1;
        end
    end

% Displaying Output
mylife = A;
pause(0.01)
pcolor(mylife)
grid on
end
