function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
%need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


	X = [ones(m, 1) X];  % Add ones to the X data matrix
	a=X*Theta1';
	hypo=sigmoid(a);
	hypo = [ones(m, 1) hypo]; % Add ones to the hypothesis data matrix
	b=hypo*Theta2';
	hypo1=sigmoid(b);
	y_matrix = eye(num_labels)(y,:);
	c1=log(hypo1);	         %calculating the cost when y=1
	c0=log(1-hypo1);	 %calculating the cost when y=0
	r=1-y_matrix;
	cost=(-(y_matrix.*c1)-(r.*c0));
	cost1=sum(cost);
	
	
	theta1_square=Theta1.^2;
	r=size(Theta1,1);
	sum1=0;
	for i=1:r
	    sum1=sum1+sum(theta1_square(i,[2:end]));
	endfor

	theta2_square=Theta2.^2;
	j=size(Theta2,1);
	sum2=0;
	for i=1:j
	    sum2=sum2+sum(theta2_square(i,[2:end]));
	endfor
	
	regterm=(sum1+sum2)*lambda;
	
	regterm=regterm/(2*m);

	J=sum(cost1)/m+regterm;
	

	%using backpropogation 
	a1=X;
	z2=Theta1*a1';
	a2=sigmoid(z2);
	a2=a2';
	a2=[ones(m,1) a2];
	z3=Theta2*a2';
	a3=sigmoid(z3);
	d3=a3'-y_matrix;
	d2=d3*(Theta2(:,2:end));
	a2=a2';
	ar=a2(2:end,:);
	d2=d2'.*ar.*(1-ar);
	Delta1=d2*a1;
	Delta2=d3'*a2';
	Theta1_grad=Delta1/m;
	Theta2_grad=Delta2/m;
	Theta1(:,1)=0;
	Theta2(:,1)=0;
	Theta1_grad=Delta1/m+(lambda/m)*Theta1;
	Theta2_grad=Delta2/m+(lambda/m)*Theta2;


	










% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
