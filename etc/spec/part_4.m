v = zeros(10, 1);
for i = 1:10,
  v(i) = 2 ^ i
 end;
 
indicies = 1:10
for i = indicies,
  disp(i)
end;

i = 1;
while i <= 5,
  v(i) = 100;
  i = i + 1;
end;

i = 1;
while true,
  v(i) = 999;
  i = i + 1;
  if i == 6,
    break ;
  end;
end;

v(1) = 2;
if v(1) == 1,
  disp("Value equals to one");
elseif v(1) == 2,
  disp("Value equals to two");
else
  disp("Value neither two nor one");
end;

addpath("C:\Users\D071857\Desktop\octave_tutorial\functions") % add the passed path to the stack of paths to look there for user-defined functions
[a, b] = squareAndCubeThisNumber(5);
disp(a);
disp(b);

x = [ 1, 1; 1, 2; 1, 3 ];
y = [ 1; 2; 3 ];
thetha = [ 0; 1 ];

cost = costFunction(x, y, thetha);
  while cost >= 2,
    cost = costFunction(x, y, thetha);
  end;
disp(cost)