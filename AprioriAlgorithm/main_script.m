% transactions
transactions = {
    [1,2,5],
    [2,4],
    [2,3],
    [1,2,4],
    [1,3],
    [2,3],
    [1,3],
    [1,2,3,5],
    [1,2,3]
};

% minSupport
minSupport = 2;

% Load necessary functions
% addpath('functions');

% Get frequent one-itemsets
frequentOneItemsets = getFrequentOneItemsets(transactions, minSupport);
disp('Frequent 1-itemsets:');
disp(frequentOneItemsets);

% Get frequent k+1 itemsets
frequentTwoItemsets = getFrequentKPlusOneItemsets(transactions, minSupport, 2, frequentOneItemsets);
disp('Frequent 2-itemsets:');
disp(frequentTwoItemsets);

frequentThreeItemsets = getFrequentKPlusOneItemsets(transactions, minSupport, 3, frequentTwoItemsets);
disp('Frequent 3-itemsets:');
disp(frequentThreeItemsets);
