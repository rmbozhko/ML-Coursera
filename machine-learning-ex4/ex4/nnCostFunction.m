function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
% Converting a vector all both Theta-s into Theta1 matrix(25x401)
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

% Converting a vector all both Theta-s into Theta2 matrix(10x26)
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

X = [ones(size(X, 1), 1) X];
a1 = sigmoid( X * Theta1' );
a1 = [ones(size(a1, 1), 1) a1];
a2 = sigmoid( a1 * Theta2' ); % calculating h(x) -> m X num_labels

for i = 1:size(X, 1)
  for j = 1:num_labels
    temp_y = zeros(size(y));
    temp_y(y == j) = 1;
    J = J + ( temp_y(i) * log( a2(i, j) ) + ( 1 - temp_y(i) ) * log( 1 - a2(i, j) ) );
    endfor;
  endfor;
 
J = -(sum(J) / m);


% Iterative version of regularization
%Theta1_sum = 0;
%for i = 2:input_layer_size
%  for j = 1:hidden_layer_size
%    Theta1_sum = Theta1_sum + (Theta1(j, i) ^ 2);
%    endfor;
%  endfor;

%Theta2_sum = 0;
% hidden_layer_size = 25, so we add + 1 to be equal 26(with bias unit at the beginning)
% and then starts from second column omitting bias-unit column
%for i = 2:hidden_layer_size + 1
%  for j = 1:num_labels
%    Theta2_sum = Theta2_sum + (Theta2(j, i) ^ 2);
%    endfor;
% endfor;
 
% Vectorized version of regularization
Theta1_sum = sum(sum(Theta1(:, 2:end) .^ 2));
Theta2_sum = sum(sum(Theta2(:, 2:end) .^ 2));
temp = (Theta1_sum + Theta2_sum);
temp = ((lambda * temp) / (2 * m));
J = J + temp;

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
