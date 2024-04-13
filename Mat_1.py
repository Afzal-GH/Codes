import numpy as np

# Given sample points
x = np.array([-5, -4, -3, -2, -1, 0, 1, 2, 3, 4])
y = np.array([69.1, 5.3, 72.0, 9.6, -10.6, 31.6, 26.8, -20.1, -0.5, -66.3])

# Construct the design matrix
X = np.column_stack([x ** i for i in range(13)])

# OLS
ols_params = np.linalg.inv(X.T @ X) @ X.T @ y

# Ridge regularization
lambda_value = 0.1  # Choose the regularization parameter lambda
ridge_params = np.linalg.inv(X.T @ X + lambda_value * np.eye(13)) @ X.T @ y

print("OLS parameters:", ols_params)
print("Ridge-regularized parameters:", ridge_params)
