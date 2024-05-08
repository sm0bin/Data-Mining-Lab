clc;

% Load the dataset (replace 'pima-indians-diabetes.csv' with the actual path to your dataset)
data = csvread('diabetes.csv');

% Split the data into features and labels
X = data(:, 1:end-1); % Features
y = data(:, end);     % Labels

% Split the data into training and testing sets (80% training, 20% testing)
rng(1); % For reproducibility
cv = cvpartition(size(data, 1), 'HoldOut', 0.2);
X_train = X(cv.training,:);
y_train = y(cv.training,:);
X_test = X(cv.test,:);
y_test = y(cv.test,:);

% Decision Tree Classifier
dtree = fitctree(X_train, y_train);
y_pred_dtree = predict(dtree, X_test);
accuracy_dtree = sum(y_pred_dtree == y_test) / numel(y_test);

% K-Nearest Neighbors Classifier
knn = fitcknn(X_train, y_train, 'NumNeighbors', 5); % You can change the value of k
y_pred_knn = predict(knn, X_test);
accuracy_knn = sum(y_pred_knn == y_test) / numel(y_test);

% Support Vector Machine Classifier
svm = fitcsvm(X_train, y_train);
y_pred_svm = predict(svm, X_test);
accuracy_svm = sum(y_pred_svm == y_test) / numel(y_test);

% Display accuracies
fprintf('Accuracy of Decision Tree: %.2f%%\n', accuracy_dtree * 100);
fprintf('Accuracy of K-Nearest Neighbors: %.2f%%\n', accuracy_knn * 100);
fprintf('Accuracy of Support Vector Machine: %.2f%%\n', accuracy_svm * 100);
