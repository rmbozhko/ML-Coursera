function [ jVal, gradient ] = costFunction( thetha )
 jVal = ( thetha(1) - 5) ^ 2 + ( thetha(2) - 5 ) ^ 2;
 gradient(1) = 2 * ( thetha(1) - 5 );
 gradient(2) = 2 * ( thetha(2) - 5 );
end;

% switching on the gradient descent, specifying the number of iterations
options = optimset( 'GradObj', 'on', 'MaxIter', 100 );

% thethas to be modified
initialTheta = zeros( 2, 1 );

% passing the pointer to costFunction, defined above
% instead of writting completely new gradient function we can combine calculating cost of thetas 
% and looking for new ones using derivatives in regarfd of passed params.
% In options variable we pass 'on' for Gradient Object, which means that we are calculating gradient and returning it in costFunction
%  and also num of steps to do before stop looking for new thetas, in our case it's 400, but we can change it.
[optThetha, functionVal, exitFlag ] = fminunc( @costFunction, initialTheta, options );

disp( optThetha );
disp( functionVal );