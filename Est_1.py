import numpy as np

# Define the given data
y = np.array([2, 1, 3])
x1 = np.array([3, 1, 2])
x2 = np.array([1, 3, 0])

# Create the design matrix X
X = np.column_stack((x1**2, x1 + 2*x1, x2))

# Add a column of ones for the intercept term
X = np.column_stack((np.ones_like(y), X))

# Estimate the parameters using least squares
beta = np.linalg.lstsq(X, y, rcond=None)[0]

# Extract the estimated values for beta1, beta2, beta3
beta1, beta2, beta3 = beta[1:]

# Print the estimated parameters
print("Estimated parameters:")
print("β₁ =", beta1)
print("β₂ =", beta2)
print("β₃ =", beta3)
