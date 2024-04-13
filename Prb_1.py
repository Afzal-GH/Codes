import scipy.stats as stats

# Demand distributions
mean_d1 = 50
std_d1 = 5
mean_d2 = 75
std_d2 = 12

# Revenue ratios
p1 = 300
p3 = 100
revenue_ratio = p3 / p1

# Calculate demand ratio for virtual class 1-2
d1_samples = stats.norm.rvs(loc=mean_d1, scale=std_d1, size=10000)
d2_samples = stats.norm.rvs(loc=mean_d2, scale=std_d2, size=10000)
d3_samples = 100 - d1_samples - d2_samples
demand_ratio = ((d1_samples + d2_samples) / d3_samples).mean()

# Calculate price for virtual class 1-2
p1_2 = (revenue_ratio * p3 * d3_samples.mean()) / (demand_ratio)

print("Price for virtual class 1-2: $", round(p1_2, 2))
