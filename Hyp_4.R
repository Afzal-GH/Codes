# Given data
data <- c(38, 35, 76, 58, 48, 59, 67, 63, 33, 69, 53, 51, 28, 25, 36, 32, 61, 57, 49, 78, 48, 42, 72, 52, 47, 66, 58, 44, 44, 56)

# Calculate mean and standard deviation
mean_val <- mean(data)
sd_val <- sd(data)

# Determine the number of bins (k) using Sturges' rule
k <- 1 + floor(log2(length(data)))

# Calculate the cumulative probabilities for the boundaries between the bins
percentiles <- seq(0, 100, length.out = k + 1)
bin_boundaries <- quantile(data, probs = percentiles / 100)

# Calculate expected frequencies for each bin
cumulative_probs <- pnorm(bin_boundaries, mean = mean_val, sd = sd_val)
expected_freq <- length(data)*diff(cumulative_probs)

# Calculate observed frequencies for each bin
observed_freq <- table(cut(data, breaks = bin_boundaries, include.lowest = TRUE))

# Perform the chi-square test
chi_sq <- sum((observed_freq - expected_freq)^2 / expected_freq)

# Calculate the critical chi-square value at alpha = 0.01 and degrees of freedom (k - 1)
critical_chi_sq <- qchisq(0.99, df = k - 1)

# Print the results
cat("Chi-square value:", chi_sq, "\n")
cat("Critical chi-square value:", critical_chi_sq, "\n")

# Compare the calculated chi-square value with the critical chi-square value
if (chi_sq > critical_chi_sq) {
   cat("Reject the null hypothesis. The data is not normally distributed at the 0.01 level of significance.\n")
} else {
   cat("Fail to reject the null hypothesis. The data may follow a normal distribution at the 0.01 level of significance.\n")
}
