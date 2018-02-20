function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function


g = zeros(size(z));

	k=sigmoid(z);
	a=k.*(1-k);
	g=a;
	g;













end
