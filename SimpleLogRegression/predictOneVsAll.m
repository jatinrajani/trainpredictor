function p = predictOneVsAll(all_theta, X)
m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

a=X*all_theta';
hypo=sigmoid(a);
[max_values,indices] =max(hypo,[],2); % It will return the indices of columns which has max values
p=indices;
p;
	
	



end

