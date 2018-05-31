% train is 50% of whole dataset, used for training model
% valid is 25% of whole dataset, used for model correctness and model properties(reg. term, learning rate) estimation
% test is 25% of whole dataset, it's real-world data with no labels in case of LogReg or any values in case of LinReg

function [train, valid, test] = partitionData(data)
  [rows, cols] = size(data);
  train = valid = test = zeros(rows, cols);
  
  % the const value below is a limit for dataset, if it's satisfied data will be splitted into 3 parts, described above
  if (rows >= 300)
    test = data(1 : end * 0.25, 1:end);
    valid = data(end * 0.25 : end * 0.5, 1:end);
    train = data(end * 0.5 : end, 1:end);
  elseif (rows >= 150)
    train = data(1 : end * 0.7, 1:end);
    valid = data(end * 0.7 : end, 1:end);
  else
    train = data;
  endif;
end;