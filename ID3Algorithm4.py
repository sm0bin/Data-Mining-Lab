from sklearn.tree import DecisionTreeClassifier
import pandas as pd

# Define the dataset
data = {
    'age': ['<=30', '<=30', '31-40', '>40', '>40', '>40', '31-40', '<=30', '<=30', '>40', '<=30', '31-40', '31-40', '>40'],
    'income': ['high', 'high', 'high', 'medium', 'low', 'low', 'low', 'medium', 'low', 'medium', 'medium', 'medium', 'high', 'medium'],
    'student': [False, False, False, False, True, True, True, False, True, True, True, False, True, False],
    'credit_rating': ['fair', 'excellent', 'fair', 'fair', 'fair', 'excellent', 'excellent', 'fair', 'fair', 'fair', 'excellent', 'excellent', 'fair', 'excellent'],
    'buys_computer': [False, False, True, True, True, False, True, False, True, True, True, True, True, False]
}

# Convert to DataFrame
df = pd.DataFrame(data)

# Convert categorical variables to numerical
df['age'] = df['age'].map({'<=30': 0, '31-40': 1, '>40': 2})
df['income'] = df['income'].map({'low': 0, 'medium': 1, 'high': 2})
df['credit_rating'] = df['credit_rating'].map({'fair': 0, 'excellent': 1})

# Create Decision Tree model
X = df.drop('buys_computer', axis=1)
y = df['buys_computer']

# # Fit the model
model = DecisionTreeClassifier(criterion='entropy')
model.fit(X, y)

from sklearn.tree import plot_tree
import matplotlib.pyplot as plt

# Visualize the decision tree
plt.figure(figsize=(12, 8))
plot_tree(model, feature_names=X.columns, class_names=['No', 'Yes'], filled=False, rounded=False)
plt.show()

# from sklearn.tree import plot_tree
# import matplotlib.pyplot as plt

# # Define function to map numerical labels back to original text labels
# def map_labels(feature, value):
#     if feature == 'age':
#         return ['<=30', '31-40', '>40'][int(value)]
#     elif feature == 'income':
#         return ['low', 'medium', 'high'][int(value)]
#     elif feature == 'credit_rating':
#         return ['fair', 'excellent'][int(value)]
#     else:
#         return str(value)

# # Visualize the decision tree with original text labels
# plt.figure(figsize=(12, 8))
# plot_tree(model, feature_names=X.columns, class_names=['No', 'Yes'], filled=True, rounded=True, impurity=False,
#           node_ids=True, proportion=True, label_func=map_labels)
# plt.show()
