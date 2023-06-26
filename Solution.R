# Set the parameters
mean_demand <- 160
std_demand <- 40
cost_per_goggle <- 150
selling_price <- 300
shortage_cost <- 40
remaining_inventory_cost <- 20
initial_inventory <- 140

# Set the number of trials
num_trials <- 1000

# Initialize variables
profits <- rep(0, num_trials)
demand_satisfied <- rep(0, num_trials)

# Run the simulation
for (i in 1:num_trials) {
   # Generate random demand from normal distribution
   demand <- rnorm(1, mean_demand, std_demand)

   # Calculate the number of goggles sold and unsatisfied demand
   sold <- min(initial_inventory, demand)
   unsatisfied <- max(demand - initial_inventory, 0)

   # Calculate revenue, cost, and profit
   revenue <- selling_price * sold
   cost <- cost_per_goggle * initial_inventory + shortage_cost * unsatisfied + remaining_inventory_cost * (initial_inventory - sold)
   profit <- revenue - cost

   # Store the profit and check if demand is completely satisfied
   profits[i] <- profit
   demand_satisfied[i] <- ifelse(unsatisfied == 0, 1, 0)
}

# Calculate average monthly profit
avg_profit <- mean(profits)

# Calculate the proportion of months with complete satisfaction
prop_satisfied <- sum(demand_satisfied) / num_trials * 100

# Run the simulation for different replenishment levels
replenishment_140 <- profits
replenishment_160 <- rep(0, num_trials)
for (i in 1:num_trials) {
   demand <- rnorm(1, mean_demand, std_demand)
   sold <- min(160, demand)
   unsatisfied <- max(demand - 160, 0)
   revenue <- selling_price * sold
   cost <- cost_per_goggle * 160 + shortage_cost * unsatisfied +  remaining_inventory_cost * (160 - sold)
   profit <- revenue - cost
   replenishment_160[i] <- profit
}

# Calculate the difference in average profit
diff_avg_profit <- mean(replenishment_160) - mean(replenishment_140)

# Bootstrap method to calculate 95% confidence interval
bootstrap_diff <- replicate(1000, {
   sample_diff <- mean(sample(replenishment_160, num_trials, replace = TRUE)) -
      mean(sample(replenishment_140, num_trials, replace = TRUE))
   sample_diff
})
lower_ci <- quantile(bootstrap_diff, 0.025)
upper_ci <- quantile(bootstrap_diff, 0.975)

# Print the results
cat("Average monthly profit (replenishment 140): $", round(avg_profit), "\n")
cat("Proportion of months with complete satisfaction: ", round(prop_satisfied), "%\n")
cat("Average difference in profit (replenishment 160 - 140): $", round(diff_avg_profit), "\n")
cat("95% Confidence interval for the difference in profit: ($", round(lower_ci), ", $", round(upper_ci), ")")
