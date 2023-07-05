# Define parameters
full_price_mean <- 200
full_price_sd <- 40
full_price_price <- 55
order_cost_base <- 28
order_cost_reduction <- 1.25
discounted_price <- 20
discounted_mean_multiplier <- 0.5
discounted_sd_multiplier <- 0.2

# Set up simulation
iterations <- 1000
profits <- numeric(iterations)
order_quantities <- numeric(iterations)

# Run simulation
for (i in 1:iterations) {
   # Generate full price demand
   full_price_demand <- round(rnorm(1, full_price_mean, full_price_sd))

   # Calculate order quantity and associated costs
   order_quantity <- min(ceiling(full_price_demand / 50) * 50, 1000)
   order_cost <- order_cost_base - ((order_quantity - 200) / 50) * order_cost_reduction
   order_cost <- max(order_cost, 0)

   # Calculate revenue and cost
   revenue <- min(order_quantity, full_price_demand) * full_price_price
   cost <- order_quantity * order_cost

   # Calculate profit
   profit <- revenue - cost

   # Generate discounted demand
   discounted_demand <- round(rnorm(1, full_price_demand * discounted_mean_multiplier, full_price_demand * discounted_sd_multiplier))

   # Calculate revenue from discounted price
   discounted_revenue <- min(order_quantity, discounted_demand) * discounted_price

   # Calculate final profit
   final_profit <- profit + discounted_revenue

   # Store results
   profits[i] <- final_profit
   order_quantities[i] <- order_quantity
}

# Analyze results
average_profits <- tapply(profits, order_quantities, mean)
optimal_quantity <- names(average_profits)[which.max(average_profits)]

# Output optimal order quantity and expected profit
cat("Optimal Order Quantity:", optimal_quantity, "\n")
cat("Expected Profit:", max(average_profits), "\n")

