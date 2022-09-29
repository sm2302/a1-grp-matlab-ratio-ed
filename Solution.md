``%%% Displaying Coway's game of life.
%% Set of rues,
% if less than 2 neighbors are live, then the live cell will be dead
% (underpopulation rule.)

% if exactly 2 or 3 neighbors are live, then the live cell will move 
% to the next generation.

% if more than 3 neighbors are live, then the live cell will be dead
% (overpopulation rule.)

% Any dead Cell will become live when exactly 3 neighbors are live
% (reproduction.)

function outMat = Solution_Matrix(inputMat)
% Copy of the inputMat
outMat = inputMat;
% Determining size of the matrix
[row, col] = size(inputMat);
% Declaring SubMatrix
A = ones(3,3);
for i = 2 : (row-1)
for j = 2 : (col-1)
% Counting number of nearest neighbourhood
count_1 = A(1,1)*inputMat(i-1,j-1) + A(1,2)*inputMat(i-1,j+1) + A(1,3)*inputMat(i+1,j-1) + A(2,1)*inputMat(i+1,j+1); 
count_2 = A(2,2)*inputMat(i-1,j) + A(2,3)*inputMat(i,j-1) + A(3,1)*inputMat(i+1,j) + A(3,2)*inputMat(i,j+1);
n = count_1 + count_2;

% if less than 2 neighbours are live, then live cell will be dead
%by underpopulation rule
if(inputMat(i,j) == 1 && n < 2)
outMat(i,j) = 0;
end
% if exactly 2 or 3 neighbouts are live, then live cell will move
%to next generation rule
if(inputMat(i,j) == 1 && n == 2 || n == 3 )
outMat(i,j) = 1;
end
% if more than 3 neighbours are live, then live cell will be dead
%due to overpopulation rule
if(inputMat(i,j) == 1 && n > 3)
outMat(i,j) = 0;
end
% Any dead Cell will become live when exactly 3 neighbours are live
%like reproduction rule
if(inputMat(i,j) == 0 && n == 3)
outMat(i,j) = 1;
end
end
end
% Displaying Output
end``
