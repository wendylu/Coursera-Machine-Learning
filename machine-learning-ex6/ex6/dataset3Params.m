function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

#{
possibleC = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
possibleSigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

best = zeros(3,1);
for C = possibleC
    for sigma = possibleSigma
		model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		prediction = svmPredict(model, Xval);
		predError = mean(double(prediction == yval));
		if(predError > best(1))
					fprintf(['Best so far %f\n'], predError);
					best = [predError, C, sigma];
		end
	endfor
endfor		

fprintf(['\n Best Found: C = %f, sigma = %f\n'], best(2), best(3));
C = best(2);
sigma = best(3);
#}

C = 1.000000
sigma = 0.100000





% =========================================================================

end
