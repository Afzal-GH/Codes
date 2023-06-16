# Restaurant X data
x <- c(86,120,120,149,262,184,119,157,159,208,332,304,180,108,153,152,92,232,
       244,181,149,199,170,124,62,204,173,117,144,169,184,199,233,197,357,305,
       206,195,180,192,109,147,172,160,167,161,170,127,133,310)

# Restaurant Y data
y <- c(104,122,149,118,174,132,108,126,131,132,135,137,231,216,296,130,92,
       137,248,146,145,198,153,140,137,148,159,134,165,136,238,233,248,237,
       231,173,84,101,57,175,72,148,141,100,128,150,128,183,148,124)

# Calculate sample statistics for Restaurant X
n_x <- length(x)
mean_x <- mean(x)
sd_x <- sd(x)

# Calculate sample statistics for Restaurant Y
n_y <- length(y)
mean_y <- mean(y)
sd_y <- sd(y)

# Define the desired confidence level
confidence_level <- 0.95

# Calculate the critical value for the t-distribution
critical_value <- qt(1 - (1 - confidence_level) / 2, df = n_x - 1)

# Calculate the margin of error for Restaurant X
margin_of_error_x <- critical_value * sd_x / sqrt(n_x)

# Calculate the confidence interval for Restaurant X
lower_bound_x <- mean_x - margin_of_error_x
upper_bound_x <- mean_x + margin_of_error_x

# Calculate the margin of error for Restaurant Y
margin_of_error_y <- critical_value * sd_y / sqrt(n_y)

# Calculate the confidence interval for Restaurant Y
lower_bound_y <- mean_y - margin_of_error_y
upper_bound_y <- mean_y + margin_of_error_y

# Print the results
cat("Restaurant X - Confidence Interval Estimate (95%):\n")
cat("Sample Mean: ", mean_x, "\n")
cat("Sample Size: ", n_x, "\n")
cat("Standard Deviation: ", sd_x, "\n")
cat("Lower Bound: ", lower_bound_x, "\n")
cat("Upper Bound: ", upper_bound_x, "\n\n")

cat("Restaurant Y - Confidence Interval Estimate (95%):\n")
cat("Sample Mean: ", mean_y, "\n")
cat("Sample Size: ", n_y, "\n")
cat("Standard Deviation: ", sd_y, "\n")
cat("Lower Bound: ", lower_bound_y, "\n")
cat("Upper Bound: ", upper_bound_y, "\n")
