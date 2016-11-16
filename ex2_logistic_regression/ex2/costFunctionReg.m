function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
n = size(theta, 1);% number of features
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(X * theta);

J = sum((-y.*log(h))-((1-y).*log(1-h)))/m + lambda/(2*m)*sum(theta(2:end).^2);

grad(1) = sum((h-y).* X(:,1))/m;
for k=2:n
    grad(k) = sum((h-y).* X(:,k))/m + lambda/m*theta(k);
end
% =============================================================

end