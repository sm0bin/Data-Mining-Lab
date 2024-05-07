transactions = [
        {1,2,5},
        {2,4},
        {2,3},
        {1,2,4},
        {1,3},
        {2,3},
        {1,3},
        {1,2,3,5},
        {1,2,3}
    ]
minSupport = 2

def generateCandidates(prevFrequentItemsets, k):
    candidates = set()

    for itemset1 in prevFrequentItemsets:
        for itemset2 in prevFrequentItemsets:
            if itemset1 != itemset2:
                candidate = itemset1.union(itemset2)
                if len(candidate) == k:
                    candidates.add(candidate)

    return candidates

def getFrequentOneItemsets(transactions, minSupport):
    itemCounts = {}

    for transaction in transactions:
        for item in transaction:
            itemCounts[item] = itemCounts.get(item, 0) + 1

    frequentOneItemsets = {frozenset([item]): count for item, count in itemCounts.items() if count >= minSupport}

    return frequentOneItemsets

frequentOneItemsets = getFrequentOneItemsets(transactions, minSupport)
print("Frequent 1-itemsets:", frequentOneItemsets)

def getFrequentKPlusOneItemsets(transactions, minSupport, k, frequentKItemsets):
    frequentKPlusOneItemsets = {}
    candidates = set()

    frequentKItemsetsList = list(frequentKItemsets.keys())
    candidates.update(generateCandidates(frequentKItemsetsList, k))

    while candidates:
        candidateCounts = {}

        for transaction in transactions:
            for candidate in candidates:
                if candidate.issubset(transaction):
                    candidateCounts[candidate] = candidateCounts.get(candidate, 0) + 1

        frequentKPlusOneItemsets.update(
            {candidate: count for candidate, count in candidateCounts.items() if count >= minSupport})

        candidates = generateCandidates(set(frequentKPlusOneItemsets.keys()), k + 1)
        k += 1

    return frequentKPlusOneItemsets

frequentTwoItemsets = getFrequentKPlusOneItemsets(transactions, minSupport, 2, frequentOneItemsets)
print("Frequent 2-itemsets:", frequentTwoItemsets)

frequentThreeItemsets = getFrequentKPlusOneItemsets(transactions, minSupport, 3, frequentTwoItemsets)
print("Frequent 3-itemsets:", frequentThreeItemsets)
