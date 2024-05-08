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
pairCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');
tripletCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

% Count occurrences of each item
for i = 1:numel(transactions)
    for j = 1:numel(transactions{i})
        item = transactions{i}(j);
        if isKey(itemCounts, item)
            itemCounts(item) = itemCounts(item) + 1;
        else
            itemCounts(item) = 1;
        end
    end
end

% Generate and display frequent 1-itemset
fprintf('Frequent 1-itemset with minimum support %d:\n', minSupport);
itemset1 = {};
for item = itemCounts.keys
    if itemCounts(item{1}) >= minSupport
        fprintf('Item %d: Count %d\n', item{1}, itemCounts(item{1}));
        itemset1 = [itemset1, item{1}];
    end
end
disp(itemset1);

% Create a Map object to store pair counts
% pairCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

% Count occurrences of each pair of items
for i = 1:numel(transactions)
    transaction = transactions{i};
    for j = 1:numel(transaction)
        for k = (j+1):numel(transaction)
            % Sort the pair to ensure consistent key
            pair = sort([transaction(j), transaction(k)]);
            key = sprintf('%d,%d', pair(1), pair(2));
            if isKey(pairCounts, key)
                pairCounts(key) = pairCounts(key) + 1;
            else
                pairCounts(key) = 1;
            end
        end
    end
end

% Generate and display frequent 2-itemset
fprintf('Frequent 2-itemset with minimum support %d:\n', minSupport);
frequentPairs = {};
for pair = pairCounts.keys
    if pairCounts(pair{1}) >= minSupport
        fprintf('Pair %s: Count %d\n', pair{1}, pairCounts(pair{1}));
        frequentPairs = [frequentPairs, pair{1}];
    end
end
% disp(frequentPairs);

% Create a Map object to store triplet counts
% tripletCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

% Count occurrences of each triplet of items
for i = 1:numel(transactions)
    transaction = transactions{i};
    for j = 1:numel(transaction)
        for k = (j+1):numel(transaction)
            for l = (k+1):numel(transaction)
                % Sort the triplet to ensure consistent key
                triplet = sort([transaction(j), transaction(k), transaction(l)]);
                key = sprintf('%d,%d,%d', triplet(1), triplet(2), triplet(3));
                if isKey(tripletCounts, key)
                    tripletCounts(key) = tripletCounts(key) + 1;
                else
                    tripletCounts(key) = 1;
                end
            end
        end
    end
end

% Generate and display frequent 3-itemset
fprintf('Frequent 3-itemset with minimum support %d:\n', minSupport);
frequentTriplets = {};
for triplet = tripletCounts.keys
    if tripletCounts(triplet{1}) >= minSupport
        fprintf('Triplet %s: Count %d\n', triplet{1}, tripletCounts(triplet{1}));
        frequentTriplets = [frequentTriplets, triplet{1}];
    end
end
% disp(frequentTriplets);

disp(itemset1);
disp(frequentPairs);
disp(frequentTriplets);
