import numpy as np

# Define the probability distributions and their corresponding values
procurement_cost = np.array([10, 11, 12])
procurement_prob = np.array([0.25, 0.45, 0.30])

labor_cost = np.array([20, 22, 24])
labor_prob = np.array([0.10, 0.25, 0.65])

transportation_cost = np.array([3, 5, 25])
transportation_prob = np.array([0.75, 0.25, 0])

selling_price = 45

# Number of simulations
num_simulations = 10000

# Initialize array to store the simulated profit per unit values
profits = np.zeros(num_simulations)

# Perform the simulation
for i in range(num_simulations):
    # Randomly sample from the probability distributions
    proc_cost = np.random.choice(procurement_cost, p=procurement_prob)
    lab_cost = np.random.choice(labor_cost, p=labor_prob)
    transp_cost = np.random.choice(transportation_cost, p=transportation_prob)
    
    # Calculate the profit per unit
    profit_per_unit = selling_price - (proc_cost + lab_cost + transp_cost)
    
    # Store the result
    profits[i] = profit_per_unit

# Calculate the mean profit per unit
mean_profit_per_unit = np.mean(profits)

# Estimate the probability of profit per unit being less than $5
prob_less_than_5 = np.mean(profits < 5)

# Print the results
print("Mean Profit per Unit:", mean_profit_per_unit)
print("Probability of Profit per Unit < $5:", prob_less_than_5)
