import numpy as np

# Transforms time-series data into a supervised learning
# problem using a sliding window.
def create_window(features, target, window_sz):
    X, y = [], []

    for i in range(window_sz, len(features)):
        X.append(features[i - window_sz:i, :])
        y.append(target[i])

    return np.array(X), np.array(y)
