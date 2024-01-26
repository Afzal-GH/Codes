# Given data
advertising_budget <- c(1300, 2000, 4000, 3500, 6500, 5000, 4400, 3500, 4000)
number_of_customers <- c(235, 315, 450, 436, 483, 575, 387, 243, 412)

# Calculate means
mean_budget <- mean(advertising_budget)
mean_customers <- mean(number_of_customers)

# Calculate sums needed for the correlation coefficient
numerator <- sum((advertising_budget - mean_budget) * (number_of_customers - mean_customers))
denominator <- sqrt(sum((advertising_budget - mean_budget)^2) * sum((number_of_customers - mean_customers)^2))

# Calculate correlation coefficient
correlation_coefficient <- numerator / denominator

cat("Pearson Correlation Coefficient:", correlation_coefficient)
