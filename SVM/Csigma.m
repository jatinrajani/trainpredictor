function [C, sigma] = Csigma(XTrain, yTrain, XTest, yTest)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.

C = 1;
sigma = 0.3;

x1=XTrain((1:end),1);
x2=XTrain((1:end),2);

Cterm=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';

sigmaterm=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';

matrsize=length(Cterm)*length(sigmaterm);

errormatr=(zeros(matrsize,3));
sum1=0;
for i=1:length(Cterm)
    for j=1:length(sigmaterm)
	sum1=sum1+1;
	model1=svmTrain(XTrain, yTrain, Cterm(i), @(x1, x2) gaussianKernel(x1, x2, sigmaterm(j)));
	pred1= svmPredict(model1, XTest);
	err=mean(double(pred1~= yTest));
	errormatr(sum1,1)=err;
	errormatr(sum1,2)=Cterm(i);
	errormatr(sum1,3)=sigmaterm(j);
   endfor
endfor	

[w,k]=min(errormatr);

C=errormatr(k(1),2);
sigma=errormatr(k(1),3);	
C
sigma



end
