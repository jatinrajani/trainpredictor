fprintf('\nTraining Linear SVM (Spam Classification)\n')
fprintf('(this may take 1 to 2 minutes) ...\n')

C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
for i=1:length(C)
	model = svmTrain(XTrain, yTrain, C(i), @linearKernel);

	p = svmPredict(model, XTrain);

	fprintf('Training Accuracy: %f\n', mean(double(p == yTrain)) * 100);

	fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')

	p = svmPredict(model, XTest);
	
	fprintf('Test Accuracy: %f\n', mean(double(p == yTest)) * 100);
	
	C(i)
endfor
