function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

pos = find(y == 1); % returns positions of found value in array, in this case: '1'(one)
neg = find(y == 0); 

%first argument is results of Exam 1, so that is why we take first column of X-array
%second argument is results of Exam 2, so that is why we take second column of X-array
%third argument is visual representation of passed datapoints
%fourth and fifth correspond to datapoints' colour
%rest deal with size of datapoints depicted on the plot
plot(X(pos, 1), X(pos, 2), 'k+', 'MarkerFaceColor', 'g', 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);


% Put some labels 

% Labels and Legend
ylabel('Exam 2 Score');
xlabel('Exam 1 Score');

legend('Admitted', 'Not admitted');
title('Admission to University');

% =========================================================================

hold off;

end
