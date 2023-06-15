# Given residuals
residuals <- c(-0.03, -0.84, -0.23, 0.73, -0.44, 1.43, -1.13, 2.24, -2.45, 0.45)

# Calculate the autocorrelation up to lag 3
autocorrelation <- acf(residuals, lag.max = 3, plot = FALSE)$acf

# Calculate Q(3)
n <- length(residuals)
Q3 <- n * (n + 2) * sum((autocorrelation[2:4]^2) / (n - 1:3))

# Critical value from chi-square distribution with 3 degrees of freedom at 0.05 significance level
critical_value <- qchisq(0.95, df = 3)

# Test the hypothesis
if (Q3 > critical_value) {
   cat("Reject the null hypothesis H0: a_t ~ WN at a significance level of 0.05\n")
} else {
   cat("Fail to reject the null hypothesis H0: a_t ~ WN at a significance level of 0.05\n")
}

# Display the calculated Q(3) and critical value
cat("Ljung-Box statistic Q(3):", Q3, "\n")
cat("Critical value:", critical_value)
