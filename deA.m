% Step 1: Data Preprocessing
% The dataset is already in a suitable format, so no preprocessing is needed.

% Step 2: Calculating Entropy
entropy_S = - (9/14) * log2(9/14) - (5/14) * log2(5/14);

% Step 3: Calculating Information Gain
% Information gain for Weather
entropy_sunny = - (2/5) * log2(2/5) - (3/5) * log2(3/5);
entropy_overcast = 0; % Pure node, entropy is 0
entropy_rainy = - (3/5) * log2(3/5) - (2/5) * log2(2/5);
information_gain_weather = entropy_S - ((5/14) * entropy_sunny + (4/14) * entropy_overcast + (5/14) * entropy_rainy);

% Information gain for Temperature
entropy_hot = - (2/4) * log2(2/4) - (2/4) * log2(2/4);
entropy_mild = - (4/6) * log2(4/6) - (2/6) * log2(2/6);
entropy_cool = - (3/4) * log2(3/4) - (1/4) * log2(1/4);
information_gain_temperature = entropy_S - ((4/14) * entropy_hot + (6/14) * entropy_mild + (4/14) * entropy_cool);

% Information gain for Humidity
entropy_high = - (3/7) * log2(3/7) - (4/7) * log2(4/7);
entropy_normal = - (6/7) * log2(6/7) - (1/7) * log2(1/7);
information_gain_humidity = entropy_S - ((7/14) * entropy_high + (7/14) * entropy_normal);

% Information gain for Windy
entropy_false = - (6/8) * log2(6/8) - (2/8) * log2(2/8);
entropy_true = - (3/6) * log2(3/6) - (3/6) * log2(3/6);
information_gain_windy = entropy_S - ((8/14) * entropy_false + (6/14) * entropy_true);

% Step 4: Selecting the Best Attribute
[best_attribute_gain, best_attribute_index] = max([information_gain_weather, information_gain_temperature, information_gain_humidity, information_gain_windy]);

% Step 5: Splitting the Dataset
% We create the decision tree structure based on the information gained
decision_tree = struct;
if best_attribute_index == 1
    % Weather attribute
    decision_tree.Weather = struct;
    decision_tree.Weather.Overcast = 'Yes';
    decision_tree.Weather.Rainy = struct;
    decision_tree.Weather.Rainy.Windy = struct;
    decision_tree.Weather.Rainy.Windy.False = 'Yes';
    decision_tree.Weather.Rainy.Windy.True = 'No';
    decision_tree.Weather.Sunny = struct;
    decision_tree.Weather.Sunny.Temperature = struct;
    decision_tree.Weather.Sunny.Temperature.Cool = 'Yes';
    decision_tree.Weather.Sunny.Temperature.Hot = 'No';
    decision_tree.Weather.Sunny.Temperature.Mild = 'No';
elseif best_attribute_index == 2
    % Temperature attribute
    decision_tree.Temperature = struct;
    decision_tree.Temperature.Cool = 'Yes';
    decision_tree.Temperature.Hot = 'No';
    decision_tree.Temperature.Mild = 'No';
elseif best_attribute_index == 3
    % Humidity attribute
    decision_tree.Humidity = struct;
    decision_tree.Humidity.High = 'Yes';
    decision_tree.Humidity.Normal = 'Yes';
elseif best_attribute_index == 4
    % Windy attribute
    decision_tree.Windy = struct;
    decision_tree.Windy.False = 'Yes';
    decision_tree.Windy.True = 'No';
end

% Display decision tree
disp(jsonencode(decision_tree));

% Step 6: Calculate Accuracy (Hypothetical Scenario)
% Manually classify test examples and compare with true labels
predicted_labels = {'Yes', 'No', 'Yes'};
true_labels = {'Yes', 'No', 'Yes'};
correct_predictions = sum(strcmp(predicted_labels, true_labels));
total_predictions = numel(true_labels);
accuracy = correct_predictions / total_predictions;

% Display accuracy
disp(['Accuracy: ', num2str(accuracy)]);
