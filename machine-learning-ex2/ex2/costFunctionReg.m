function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% commonly used variables, calculated in advance for convenience
z = X * theta;
g = sigmoid(z);

% cost function with regularized term is calculated
% mention, that we don't apply regularization rule to theta(1), cause of convention
% we can do so but it will change the total result of cost function for some really small amount
J = -((y' * log(g)) + (1 - y)' * (log(1 - g)))
J = J / m;
J = J + ((lambda / (2 * m)) * (sum(theta(2:end, :) .^ 2)));

grad = ((g - y)' * (X))';
grad = grad / m;
% very import to do this operator, as mentioned in formula
lambda = lambda / m;

% retrieving value of gradient, cause due to convention we should apply regularization to theta(1)
% we don't retrieve same position value for theta, cause we won't return it and use further
grad_val = grad(1);
grad = grad(2:end, :) + (lambda * theta(2:end, :));
grad = [grad_val; grad];

% =============================================================

end
