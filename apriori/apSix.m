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
