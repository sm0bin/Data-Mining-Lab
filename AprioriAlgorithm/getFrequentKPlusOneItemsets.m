function frequentKPlusOneItemsets = getFrequentKPlusOneItemsets(transactions, minSupport, k, frequentKItemsets)
    frequentKPlusOneItemsets = containers.Map;
    candidates = {};
    frequentKItemsetsList = keys(frequentKItemsets);
    candidates = generateCandidates(frequentKItemsetsList, k);
    
    while ~isempty(candidates)
        candidateCounts = containers.Map;
        
        for i = 1:length(transactions)
            transaction = transactions{i};
            for j = 1:length(candidates)
                candidate = candidates{j};
                if all(ismember(candidate, transaction))
                    if isKey(candidateCounts, candidate)
                        candidateCounts(candidate) = candidateCounts(candidate) + 1;
                    else
                        candidateCounts(candidate) = 1;
                    end
                end
            end
        end
        
        keysToRemove = {};
        keys = candidateCounts.keys;
        for i = 1:length(keys)
            key = keys{i};
            if candidateCounts(key) < minSupport
                keysToRemove{end+1} = key;
            end
        end
        
        for i = 1:length(keysToRemove)
            remove(candidateCounts, keysToRemove{i});
        end
        
        keys = candidateCounts.keys;
        for i = 1:length(keys)
            key = keys{i};
            frequentKPlusOneItemsets(key) = candidateCounts(key);
        end
        
        candidates = generateCandidates(keys, k+1);
        k = k + 1;
    end
end
