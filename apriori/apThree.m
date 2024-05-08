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