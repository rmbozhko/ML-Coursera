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
[optThetha, functionVal, exitFlag ] = fminunc( @costFunction, initialTheta, options );

disp( optThetha );
disp( functionVal );