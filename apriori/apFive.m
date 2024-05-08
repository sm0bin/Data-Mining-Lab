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
