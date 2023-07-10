import numpy as np

# Demand distributions
mean_d1 = 50
std_d1 = 5
mean_d2 = 75
std_d2 = 12

# Class prices
p1 = 300
p2 = 200
p3 = 100

# Calculate demand for class 3
demand_d3 = 100 - np.random.normal(mean_d1, std_d1) - np.random.normal(mean_d2, std_d2)

# Calculate revenue ratio
revenue_ratio = (p3 * demand_d3) / (p1 * np.random.normal(mean_d1, std_d1))

# Calculate price for virtual class 1-2
price_p1_2 = (revenue_ratio * p3 * demand_d3) / (np.random.normal(mean_d1, std_d1) + np.random.normal(mean_d2, std_d2))

print("Price for the virtual class 1-2 under EMSR-b:", price_p1_2)
