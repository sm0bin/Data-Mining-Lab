import pandas as pd
import numpy as np
import random

# Define the dataset
data = {
    'weather': ['Sunny', 'Sunny', 'Overcast', 'Rainy', 'Rainy', 'Rainy', 'Overcast', 'Sunny', 'Sunny', 'Rainy', 'Sunny', 'Overcast', 'Overcast', 'Rainy'],
    'temperature': ['Hot', 'Hot', 'Hot', 'Mild', 'Cool', 'Cool', 'Cool', 'Mild', 'Cool', 'Mild', 'Mild', 'Mild', 'Hot', 'Mild'],
    'humidity': ['High', 'High', 'High', 'High', 'Normal', 'Normal', 'Normal', 'High', 'Normal', 'Normal', 'Normal', 'High', 'Normal', 'High'],
    'windy': [False, True, False, False, False, True, True, False, False, False, True, True, False, True],
    'playTennis': ['No', 'No', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No']
}

df = pd.DataFrame(data)

def entropy(targetCol):
    elements, counts = np.unique(targetCol, return_counts=True)
    entropyVal = -np.sum([(counts[i] / np.sum(counts)) * np.log2(counts[i] / np.sum(counts)) for i in range(len(elements))])
    return entropyVal

def informationGain(data, splitAttributeName, targetName):
    totalEntropy = entropy(data[targetName])
    vals, counts= np.unique(data[splitAttributeName], return_counts=True)
    weightedEntropy = np.sum([(counts[i] / np.sum(counts)) * entropy(data.where(data[splitAttributeName]==vals[i]).dropna()[targetName]) for i in range(len(vals))])
    informationGainVal = totalEntropy - weightedEntropy
    return informationGainVal

def id3Algorithm(data, originalData, features, targetAttributeName, parentNodeClass):
    # Base cases
    if len(np.unique(data[targetAttributeName])) <= 1:
        return np.unique(data[targetAttributeName])[0]
    elif len(data) == 0:
        return np.unique(originalData[targetAttributeName])[np.argmax(np.unique(originalData[targetAttributeName], return_counts=True)[1])]
    elif len(features) == 0:
        return parentNodeClass
    else:
        parentNodeClass = np.unique(data[targetAttributeName])[np.argmax(np.unique(data[targetAttributeName], return_counts=True)[1])]
        itemValues = [informationGain(data, feature, targetAttributeName) for feature in features]
        bestFeatureIndex = np.argmax(itemValues)
        bestFeature = features[bestFeatureIndex]
        tree = {bestFeature: {}}
        features = [i for i in features if i != bestFeature]
        for value in np.unique(data[bestFeature]):
            value = value
            subData = data.where(data[bestFeature] == value).dropna()
            subtree = id3Algorithm(subData, data, features, targetAttributeName, parentNodeClass)
            tree[bestFeature][value] = subtree
        return tree

def predict(query, tree, default = 1):
    for key in list(query.keys()):
        if key in list(tree.keys()):
            try:
                result = tree[key][query[key]]
            except:
                return default
            result = tree[key][query[key]]
            if isinstance(result, dict):
                return predict(query, result)
            else:
                return result

def trainTestSplit(df, testSize):
    if isinstance(testSize, float):
        testSize = round(testSize * len(df))
    indices = df.index.tolist()
    testIndices = random.sample(population=indices, k=testSize)
    testDf = df.loc[testIndices]
    trainDf = df.drop(testIndices)
    return trainDf, testDf

trainData, testData = trainTestSplit(df, testSize=0.2)

def fit(df, targetAttributeName, features):
    return id3Algorithm(df, df, features, targetAttributeName, None)

def getAccuracy(df, tree):
    df["classification"] = df.apply(predict, axis=1, args=(tree, 'Yes'))
    df["classificationCorrect"] = df["classification"] == df["playTennis"]
    accuracy = df["classificationCorrect"].mean()
    return accuracy

tree = fit(trainData, 'playTennis', ['weather', 'temperature', 'humidity', 'windy'])
accuracy = getAccuracy(testData, tree)
print("Decision Tree:")
print(tree)
print("Accuracy:", accuracy)
