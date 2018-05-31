% loading and manipulating dataset
data = load("iris.txt");
data = shuffleData(data);
[train, valid] = partitionData(data);
X = train(:, [1 : end - 1]);
Y = train(: , end);
% setting useful variables
labels_num = 3;
lambda = 3;
[rows cols] = size(X);

all_thetas_0 = oneVsAll(X, Y, labels_num, lambda);

X_backup = X;
X = [ones(rows, 1) X];

options = optimset("GradObj", "on", "Maxiter", 400);

init_thetas = zeros(cols + 1, 1);
all_thetas_1 = zeros(labels_num, cols + 1);
for j = 1:labels_num
  [theta, cost] = fminunc(@(t)(costFunction(t, X, (Y == j))), init_thetas, options);
  fprintf('Cost at theta found by fminunc for class %d: %f\n', j, cost);
  all_thetas_1(j, :) = theta;
 end
 
X_valid = valid(: , [1 : end - 1]);
Y_valid = valid(: , end);

p_0 = predictOneVsAll(all_thetas_0, X_valid, true);
p_1 = predictOneVsAll(all_thetas_1, X_valid, true);

fprintf('Train Accuracy with regularized LR: %.2f%%\n', mean(double(p_0 == Y_valid)) * 100);
fprintf('Train Accuracy of LR without regularization term: %.2f%%\n', mean(double(p_1 == Y_valid)) * 100);