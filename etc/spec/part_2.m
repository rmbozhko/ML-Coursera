A = [ 1, 2; 3, 4; 5, 6 ];
B = [ 11, 12; 13, 14; 15, 16 ];
C = [ 1, 1; 2, 2 ];

A * C % row by column matrix multiplication
A .* B % by element multiplication A[1, 1] is multiplied by B[1, 1] and so forth
A .^ 2 % each element of A to the power of 2
-A % all values change their sign, pos to neg and neg to pos
A' % transposing matrix A
C < 1.5 % returns logical vector containing compared elements
find( C < 1.5 ) % returns a vector of indexes of elements less than 1.5
magic(3) % returns the "magic" matrix where each row and column gives same summ result
sum(A) % will summ each column elems
prod(A) % will multiply by column
max(A, [], 1) % taking max values per columns, last param is dimension
max(A, [], 2) % taking max values per rows
% flipud(matrix_name) % flips up the matrix_name from up to bottom and vice versa