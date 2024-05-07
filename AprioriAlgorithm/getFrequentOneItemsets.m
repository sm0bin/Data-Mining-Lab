function frequentOneItemsets = getFrequentOneItemsets(transactions, minSupport)
    itemCounts = containers.Map;
    
    for i = 1:length(transactions)
        transaction = transactions{i};
        for j = 1:length(transaction)
            item = transaction(j);
            if isKey(itemCounts, item)
                itemCounts(item) = itemCounts(item) + 1;
            else
                itemCounts(item) = 1;
            end
        end
    end
    
    keysToRemove = {};
    keys = itemCounts.keys;
    for i = 1:length(keys)
        key = keys{i};
        if itemCounts(key) < minSupport
            keysToRemove{end+1} = key;
        end
    end
    
    for i = 1:length(keysToRemove)
        remove(itemCounts, keysToRemove{i});
    end
    
    frequentOneItemsets = containers.Map(itemCounts.keys, itemCounts.values);
end
