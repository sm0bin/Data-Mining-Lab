clc;

transactions = {
    [1, 2, 5],
    [2, 4],
    [2, 3],
    [1, 2, 4],
    [1, 3],
    [2, 3],
    [1, 3],
    [1, 2, 3, 5],
    [1, 2, 3]
};

minSupport = 2;

% Create a Map object to store item counts
itemCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

% Create a Map object to store pair counts
pairCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

% Create a Map object to store triplet counts
tripletCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

% Loop through transactions to count occurrences of items, pairs, and triplets
for i = 1:numel(transactions)
    transaction = transactions{i};
    for j = 1:numel(transaction)
        % Count occurrences of individual items
        item = num2str(transaction(j));
        if isKey(itemCounts, item)
            itemCounts(item) = itemCounts(item) + 1;
        else
            itemCounts(item) = 1;
        end
        
        % Count occurrences of pairs
        for k = (j+1):numel(transaction)
            pair = sort([transaction(j), transaction(k)]);
            key = sprintf('%d,%d', pair(1), pair(2));
            key = num2str(key);
            if isKey(pairCounts, key)
                pairCounts(key) = pairCounts(key) + 1;
            else
                pairCounts(key) = 1;
            end
            
            % Count occurrences of triplets
            for l = (k+1):numel(transaction)
                triplet = sort([transaction(j), transaction(k), transaction(l)]);
                key = sprintf('%d,%d,%d', triplet(1), triplet(2), triplet(3));
                key = num2str(key);
                if isKey(tripletCounts, key)
                    tripletCounts(key) = tripletCounts(key) + 1;
                else
                    tripletCounts(key) = 1;
                end
            end
        end
    end
end

% Generate and display frequent 1-itemset
fprintf('Frequent One Itemset with minimum support %d:\n', minSupport);
frequentOneItemSet = {};
for item = itemCounts.keys
    if itemCounts(item{1}) >= minSupport
        fprintf('Item %s: Count %d\n', item{1}, itemCounts(item{1}));
        frequentOneItemSet = [frequentOneItemSet, item{1}];
    end
end
disp(frequentOneItemSet);

% Generate and display frequent 2-itemset
fprintf('Frequent Two Itemset with minimum support %d:\n', minSupport);
frequentTwoItemSet = {};
for pair = pairCounts.keys
    if pairCounts(pair{1}) >= minSupport
        fprintf('Pair %s: Count %d\n', pair{1}, pairCounts(pair{1}));
        frequentTwoItemSet = [frequentTwoItemSet, pair{1}];
    end
end
disp(frequentTwoItemSet);

% Generate and display frequent 3-itemset
fprintf('Frequent Three Itemset with minimum support %d:\n', minSupport);
frequentThreeItemSet = {};
for triplet = tripletCounts.keys
    if tripletCounts(triplet{1}) >= minSupport
        fprintf('Triplet %s: Count %d\n', triplet{1}, tripletCounts(triplet{1}));
        frequentThreeItemSet = [frequentThreeItemSet, triplet{1}];
    end
end
disp(frequentThreeItemSet);
