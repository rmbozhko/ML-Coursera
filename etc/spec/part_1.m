A = [1, 2, 3; 4, 5, 6];
sz = size(A);
disp(sz)
disp(length(A))

% load("data.dat") %used to load the data to workspace
% load data.dat % same as the one above

% who % shows all variables that exist in workspace so far
% whos % shows all variables and additional info: size(dimensions), used memory to store, data type
% clear % delete all variables from a workspace
% clear var_name % delete var_name from a workspace
% clc % make same as clrscr in Pascal
% save file_name.mat var_name % saves var_name into file_name.mat convenient for matlab or octave to handle
% save file_name.txt var_name -ascii % saves var_name into file_name.mat convenient for humans to handle
% matrix_name(:, 2) % retrive every element within second column
% matrix_name(2, :) % retrive every element within second row
% matrix_name([1 3], :) % retrive all columns of first and third rows
% matrix_name(:, 2) = [ 10; 11; 12 ] % retrive every element within second column and changing values to given ones
% matrix_name = [matrix_name, [ 100; 101; 102 ]] % append a new column to the right side of existing matrix
% matrix_name(:) % put all elements of matrix_name into a single vector
% matrix_name[mat_1 mat_2] || matrix_name[mat_1, mat_2] % appending mat_2 to the right side of mat_1
% matrix_name[mat_1; mat_2] % appending mat_2 to the bottom of mat_1

%%Important information
%e-014 -> stands for zero, so if you see smth like this: 1.7824e-014 -> it's zero, but 1.7824-e013 is not.
