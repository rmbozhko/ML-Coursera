function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   1, X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%   1, X1, X2, X1.^2, X2.^2, X1*X2, X2.^2, X1.^3, (X1.^2).* X2, X1.* (X2.^2), etc ....
%   Inputs X1, X2 must be the same size
%

%degree = 30; % Train accurancy: 86. 44%
degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
      % each time we execute line below we add new column to X array
      % of much higher degree polynomial, the higher polynomial better fit to the data
      % but we can overfit the existing data, that is why we need regularization term
      % to handle overfitting we can either erase complexity of features, make h_func simpler
      % or play around reg. term and apply it there
      out(:, end+1) = (X1.^(i-j)).*(X2.^j); % x1^1 .* x2 ^ 0
    end
end

end