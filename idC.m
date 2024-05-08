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
data_table = table(age', income', student', credit_rating', buys_computer', 'VariableNames', {'Age', 'Income', 'Student', 'Credit_rating', 'Buys_computer'});

% Convert categorical variables to categorical data type
data_table.Age = categorical(data_table.Age);
data_table.Income = categorical(data_table.Income);
data_table.Credit_rating = categorical(data_table.Credit_rating);
data_table.Buys_computer = categorical(data_table.Buys_computer);

% Train decision tree
tree_model = fitctree(data_table(:,1:4), data_table.Buys_computer);

% View the decision tree
view(tree_model, 'Mode', 'graph');
