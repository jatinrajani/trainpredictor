%% ================ Part 1: Training One Vs All Logistic Regression  ================


fprintf('\nTraining One-vs-All Logistic Regression...\n')

lambda = 1;
[all_theta] = oneVsAll(X, y, 5, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All =====================================

pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

