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

% Create a Map object to store item counts
itemCounts = containers.Map('KeyType', 'double', 'ValueType', 'double');

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

% Generate itemset 1 with frequencies greater than 2
itemset1 = {};
for item = itemCounts.keys
    if itemCounts(item{1}) >= 2
        itemset1 = [itemset1, item{1}];
    end
end

% Loop to display values
for i = 1:numel(transactions)
    fprintf('Transaction %d: ', i);
    disp(transactions{i});
end

% Display item counts
keys = itemCounts.keys;
values = itemCounts.values;
for k = 1:numel(keys)
    fprintf('Item %d: Count %d\n', keys{k}, values{k});
end

% Display itemset 1
% fprintf('Itemset 1 with frequencies greater than 3:', num2str(itemset1));
disp(itemset1);

% Create a Map object to store pair counts
pairCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

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

% Find pairs with occurrences greater than or equal to 2
commonPairs = {};
fprintf('Pairs that are common in the transactions with at least 2 occurrences:\n');
for pair = pairCounts.keys
    if pairCounts(pair{1}) >= 2
        fprintf('%s: Occurrences %d\n', pair{1}, pairCounts(pair{1}));
        commonPairs = [commonPairs, pair{1}];
    end
end

% ----------------------------

% Create a Map object to store triplet counts
tripletCounts = containers.Map('KeyType', 'char', 'ValueType', 'double');

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

% Find triplets with occurrences greater than or equal to 2
frequentTriplets = {};
fprintf('Triplets that are common in the transactions with at least 2 occurrences:\n');
for triplet = tripletCounts.keys
    if tripletCounts(triplet{1}) >= 2
        fprintf('%s: Occurrences %d\n', triplet{1}, tripletCounts(triplet{1}));
        frequentTriplets = [frequentTriplets, triplet{1}];
    end
end