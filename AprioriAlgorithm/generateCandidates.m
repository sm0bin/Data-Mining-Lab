function candidates = generateCandidates(prevFrequentItemsets, k)
    candidates = {};
    n = length(prevFrequentItemsets);
    
    for i = 1:n
        for j = (i+1):n
            itemset1 = prevFrequentItemsets{i};
            itemset2 = prevFrequentItemsets{j};
            candidate = union(itemset1, itemset2);
            if length(candidate) == k
                candidates{end+1} = candidate;
            end
        end
    end
end
