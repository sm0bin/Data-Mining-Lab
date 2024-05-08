% Define the decision tree as a nested dictionary
decision_tree = {'Weather', {'Overcast', 'Yes', 'Rainy', {'Windy', {false, 'Yes', true, 'No'}}, 'Sunny', {'Temperature', {'Cool', 'Yes', 'Hot', 'No', 'Mild', 'No'}}}};

% Print decision tree
disp(decision_tree{1});
for i = 1:2:length(decision_tree{2})
    disp(['  ', decision_tree{2}{i}]);
    if iscell(decision_tree{2}{i+1})
        sub_tree = decision_tree{2}{i+1};
        for j = 1:2:length(sub_tree)
            disp(['    ', sub_tree{j}, ': ', sub_tree{j+1}]);
        end
    else
        disp(['    ', decision_tree{2}{i+1}]);
    end
end
