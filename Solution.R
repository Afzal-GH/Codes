# Define the probability distributions and their corresponding values
procurement_cost <- c(10, 11, 12)
procurement_prob <- c(0.25, 0.45, 0.30)

labor_cost <- c(20, 22, 24)
labor_prob <- c(0.10, 0.25, 0.65)

transportation_cost <- c(3, 5, 25)
transportation_prob <- c(0.75, 0.25, 0)

selling_price <- 45

# Number of simulations
num_simulations <- 10000

# Initialize vectors to store the simulated profit per unit values
profits <- numeric(num_simulations)

# Perform the simulation
for (i in 1:num_simulations) {
   # Randomly sample from the probability distributions
   proc_cost <- sample(procurement_cost, 10, replace = TRUE, prob = procurement_prob)
   labor_cost <- sample(labor_cost, 10, replace = TRUE, prob = labor_prob)
   transp_cost <- sample(transportation_cost, 10, replace = TRUE, prob = transportation_prob)

   # Calculate the profit per unit
   profit_per_unit <- selling_price - (proc_cost + labor_cost + transp_cost)

   # Store the result
   profits[i] <- profit_per_unit
}

# Calculate the mean profit per unit
mean_profit_per_unit <- mean(profits)

# Estimate the probability of profit per unit being less than $5
prob_less_than_5 <- mean(profits < 5)

# Print the results
cat("Mean Profit per Unit:", mean_profit_per_unit, "\n")
cat("Probability of Profit per Unit < $5:", prob_less_than_5, "\n")
