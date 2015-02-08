function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


h = X * theta;
error = h - y;
errorSq = error .^ 2;
sumErrors = sum(errorSq);

thetaSq = theta .^ 2;
thetaSq(1) = 0;
sumThetaSq = sum(thetaSq);

J = (1 / (2*m)) * sumErrors + (lambda / (2 * m)) * sumThetaSq;


regInnerTerm = error' * X;
regTerm = (lambda / m) .* theta';
regTerm(1) = 0;
grad = (1 / m) .* regInnerTerm .+ regTerm;






% =========================================================================

grad = grad(:);

end
