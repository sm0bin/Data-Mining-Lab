clc;

% Define the data
age = {'<=30', '<=30', '31…40', '>40', '>40', '>40', '31…40', '<=30', '<=30', '>40', '<=30', '31…40', '31…40', '>40'};
income = {'high', 'high', 'high', 'medium', 'low', 'low', 'low', 'medium', 'low', 'medium', 'medium', 'medium', 'high', 'medium'};
student = [false, false, false, false, true, true, true, false, true, true, true, false, true, false];
credit_rating = {'Fair', 'excellent', 'Fair', 'Fair', 'Fair', 'excellent', 'excellent', 'Fair', 'Fair', 'Fair', 'excellent', 'excellent', 'Fair', 'excellent'};
buys_computer = [false, false, true, true, true, false, true, false, true, true, true, true, true, false];

% Convert data to lowercase
age = lower(age);
income = lower(income);
credit_rating = lower(credit_rating);

% Create a table
data_table = table(age', income', student', credit_rating', buys_computer', 'VariableNames', {'age', 'income', 'student', 'credit_rating', 'buys_computer'});
disp(data_table);

% Calculate the probabilities of each outcome
prob_true = sum(buys_computer) / numel(buys_computer);
prob_false = 1 - prob_true;

% Calculate entropy
entropy_buys_computer = - (prob_true * log2(prob_true) + prob_false * log2(prob_false));
disp(entropy_buys_computer);


ig_age = entropy_buys_computer