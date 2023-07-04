# January enjoyment levels
jan_enjoyment <- c(3, 4, 2, 3, 4, 3, 2, 4, 3, 1)

# March enjoyment levels
mar_enjoyment <- c(3, 4, 3, 5, 5, 4, 3, 4, 4, 3)

# Calculate the differences
delta_x <- mar_enjoyment - jan_enjoyment

# Set the hypothesized mean difference
mu <- 0.2

# Calculate the sample mean of the differences
mean_diff <- mean(delta_x)

# Calculate the standard deviation of the differences
sd_diff <- sd(delta_x)

# Calculate the standard error of the mean difference
se_diff <- sd_diff / sqrt(length(delta_x))

# Calculate the t-statistic
t_stat <- (mean_diff - mu) / se_diff

# Calculate the degrees of freedom
df <- length(delta_x) - 1

# Calculate the p-value
p_value <- pt(t_stat, df, lower.tail = FALSE)

# Define the significance level
alpha <- 0.05

# Perform the hypothesis test
if (p_value < alpha) {
   cat("Reject the null hypothesis. There is sufficient evidence to conclude that the enjoyment levels have improved after the release of the ad.\n")
} else {
   cat("Fail to reject the null hypothesis. There is not enough evidence to conclude that the enjoyment levels have improved after the release of the ad.\n")
}

# Print the test statistics and p-value
cat("t-statistic:", t_stat, "\n")
cat("p-value:", p_value, "\n")
