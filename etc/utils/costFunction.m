function J = costFunction(X, y, thetha)
  % X is the "design matrix" containing our training examples
  % y is the output values
  
  m = size(X, 1); % number of training examples
  predictions = X * thetha; % predictions of hypothesis on all m
  sqrErrors = (predictions - y) .^ 2; % squared errors
  
  J = 1 / (2 * m) * sum(sqrErrors);
  