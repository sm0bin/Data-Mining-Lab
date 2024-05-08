% Define the data
Age = {'<=30', '<=30', '31…40', '>40', '>40', '>40', '31…40', '<=30', '<=30', '>40', '<=30', '31…40', '31…40', '>40'};
Income = {'high', 'high', 'high', 'medium', 'low', 'low', 'low', 'medium', 'low', 'medium', 'medium', 'medium', 'high', 'medium'};
Student = [false, false, false, false, true, true, true, false, true, true, true, false, true, false];
Credit_rating = {'Fair', 'excellent', 'Fair', 'Fair', 'Fair', 'excellent', 'excellent', 'Fair', 'Fair', 'Fair', 'excellent', 'excellent', 'Fair', 'excellent'};
Buys_computer = [false, false, true, true, true, false, true, false, true, true, true, true, true, false];

% Calculate entropy of 'Buys_computer'
prob_true = sum(Buys_computer) / numel(Buys_computer);
prob_false = 1 - prob_true;
entropy_Buys_computer = - (prob_true * log2(prob_true) + prob_false * log2(prob_false));

% Calculate information gain for each attribute
information_gain = zeros(1, 4);

% Calculate information gain for 'Age'
unique_Age = unique(Age);
weighted_entropy_Age = 0;
for i = 1:numel(unique_Age)
    mask = strcmp(Age, unique_Age{i});
    prob_true = sum(Buys_computer(mask)) / sum(mask);
    prob_false = 1 - prob_true;
    entropy = -(prob_true * log2(prob_true) + prob_false * log2(prob_false));
    weighted_entropy_Age = weighted_entropy_Age + entropy * sum(mask) / numel(Buys_computer);
end
information_gain(1) = entropy_Buys_computer - weighted_entropy_Age;

% Calculate information gain for 'Income'
unique_Income = unique(Income);
weighted_entropy_Income = 0;
for i = 1:numel(unique_Income)
    mask = strcmp(Income, unique_Income{i});
    prob_true = sum(Buys_computer(mask)) / sum(mask);
    prob_false = 1 - prob_true;
    entropy = -(prob_true * log2(prob_true) + prob_false * log2(prob_false));
    weighted_entropy_Income = weighted_entropy_Income + entropy * sum(mask) / numel(Buys_computer);
end
information_gain(2) = entropy_Buys_computer - weighted_entropy_Income;

% Calculate information gain for 'Student'
prob_true = sum(Student) / numel(Student);
prob_false = 1 - prob_true;
entropy_Student = - (prob_true * log2(prob_true) + prob_false * log2(prob_false));
information_gain(3) = entropy_Buys_computer - entropy_Student;

% Calculate information gain for 'Credit_rating'
unique_Credit_rating = unique(Credit_rating);
weighted_entropy_Credit_rating = 0;
for i = 1:numel(unique_Credit_rating)
    mask = strcmp(Credit_rating, unique_Credit_rating{i});
    prob_true = sum(Buys_computer(mask)) / sum(mask);
    prob_false = 1 - prob_true;
    entropy = -(prob_true * log2(prob_true) + prob_false * log2(prob_false));
    weighted_entropy_Credit_rating = weighted_entropy_Credit_rating + entropy * sum(mask) / numel(Buys_computer);
end
information_gain(4) = entropy_Buys_computer - weighted_entropy_Credit_rating;

% Display information gain for each attribute
attribute_names = {'Age', 'Income', 'Student', 'Credit_rating'};
disp('Information Gain for each attribute:');
for i = 1:numel(information_gain)
    fprintf('%s: %.4f\n', attribute_names{i}, information_gain(i));
end
