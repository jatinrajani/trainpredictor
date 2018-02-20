function [J, grad] = lrCostFunction(theta, X, y, lambda)
m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));

theta1=theta;
gradmatrix=zeros(size(theta));	
a=X*theta;
hypo=sigmoid(a); %It wil give hypothesis matrix 
c1=log(hypo);	 %calculating the cost when y=1
c0=log(1-hypo);	 %calculating the cost when y=0
r=1-y;
cost=(-(c1'*y)-(c0'*r));
theta1=theta(2:end);
theta1=theta1.**2;  %squaring the theta matrix
regterm=(sum(theta1,1)*lambda)/2; %calculating the regularization parameter
cost=(cost+regterm)/m; 	%It wil give cost
	
g=(hypo-y);
grad1=X'*g;	%It wil give gradient matrix
gradmatrix(1)=grad1(1)/m;
f=lambda/m;
gradmatrix(2:end)=grad1(2:end)/m+f*theta(2:end);
	
grad=round(gradmatrix .* 10000) ./ 10000;


J=cost;
grad = grad(:);

end
	
