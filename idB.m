% Define the data
age = {'<=30', '<=30', '31-40', '>40', '>40', '>40', '31-40', '<=30', '<=30', '>40', '<=30', '31-40', '31-40', '>40'};
income = {'high', 'high', 'high', 'medium', 'low', 'low', 'low', 'medium', 'low', 'medium', 'medium', 'medium', 'high', 'medium'};
student = [false, false, false, false, true, true, true, false, true, true, true, false, true, false];
credit_rating = {'fair', 'excellent', 'fair', 'fair', 'fair', 'excellent', 'excellent', 'fair', 'fair', 'fair', 'excellent', 'excellent', 'fair', 'excellent'};
buys_computer = [false, false, true, true, true, false, true, false, true, true, true, true, true, false];

% Convert data to lowercase
% age = lower(age);
% income = lower(income);
% credit_rating = lower(credit_rating);

% Calculate the probabilities of each outcome for Buys_computer
prob_true = sum(buys_computer) / numel(buys_computer);
prob_false = 1 - prob_true;

% Calculate entropy for Buys_computer
entropy_buys_computer = - (prob_true * log2(prob_true) + prob_false * log2(prob_false));

% Calculate information gain for Age
unique_age = unique(age);
weighted_entropy_age = 0;
for i = 1:numel(unique_age)
    mask = strcmp(age, unique_age{i});
    prob_true_age = sum(buys_computer(mask)) / sum(mask);
    prob_false_age = 1 - prob_true_age;
    entropy_age = -(prob_true_age * log2(prob_true_age) + prob_false_age * log2(prob_false_age));
    weighted_entropy_age = weighted_entropy_age + entropy_age * sum(mask) / numel(buys_computer);
end
ig_age = entropy_buys_computer - weighted_entropy_age;

% Calculate information gain for Income
unique_income = unique(income);
weighted_entropy_income = 0;
for i = 1:numel(unique_income)
    mask = strcmp(income, unique_income{i});
    prob_true_income = sum(buys_computer(mask)) / sum(mask);
    prob_false_income = 1 - prob_true_income;
    entropy_income = -(prob_true_income * log2(prob_true_income) + prob_false_income * log2(prob_false_income));
    weighted_entropy_income = weighted_entropy_income + entropy_income * sum(mask) / numel(buys_computer);
end
ig_income = entropy_buys_computer - weighted_entropy_income;

% Calculate information gain for Student
prob_true_student = sum(student) / numel(student);
prob_false_student = 1 - prob_true_student;
entropy_student = - (prob_true_student * log2(prob_true_student) + prob_false_student * log2(prob_false_student));
ig_student = entropy_buys_computer - entropy_student;

% Calculate information gain for Credit_rating
unique_credit_rating = unique(credit_rating);
weighted_entropy_credit_rating = 0;
for i = 1:numel(unique_credit_rating)
    mask = strcmp(credit_rating, unique_credit_rating{i});
    prob_true_credit_rating = sum(buys_computer(mask)) / sum(mask);
    prob_false_credit_rating = 1 - prob_true_credit_rating;
    entropy_credit_rating = -(prob_true_credit_rating * log2(prob_true_credit_rating) + prob_false_credit_rating * log2(prob_false_credit_rating));
    weighted_entropy_credit_rating = weighted_entropy_credit_rating + entropy_credit_rating * sum(mask) / numel(buys_computer);
end
ig_credit_rating = entropy_buys_computer - weighted_entropy_credit_rating;

% Display information gain for each attribute
disp(['Information Gain for Age: ', num2str(ig_age)]);
disp(['Information Gain for Income: ', num2str(ig_income)]);
disp(['Information Gain for Student: ', num2str(ig_student)]);
disp(['Information Gain for Credit Rating: ', num2str(ig_credit_rating)]);
