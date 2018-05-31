function  new_data = shuffleData(data)
  [rows cols] = size(data);
  new_data = data(randperm(rows), :);
end;