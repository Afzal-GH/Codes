# Load the package
library(LearnBayes)

# Set the parameters
pi <- 0.9
Nm <- 5
N <- 23
f <- 3

# Calculate the reliability and credibility intervals
reliability_interval <- qbeta(c(0.025, 0.975), f + 1, N - f + 1)
credibility_interval <- qbeta(c(0.025, 0.975), f + pi * Nm, N - f + (1 - pi) * Nm)

# Print the results
print(reliability_interval)
print(credibility_interval)

# Set the new value for Nm
Nm <- 15

# Recalculate the reliability and credibility intervals
reliability_interval <- qbeta(c(0.025, 0.975), f + 1, N - f + 1)
credibility_interval <- qbeta(c(0.025, 0.975), f + pi * Nm, N - f + (1 - pi) * Nm)

# Print the results
print(reliability_interval)
print(credibility_interval)

# Calculate the reliability and credibility intervals with uniform prior
reliability_interval <- qbeta(c(0.025, 0.975), f + 1, N - f + 1)
credibility_interval <- qbeta(c(0.025, 0.975), f + 1, N - f + 1)

# Print the results
print(reliability_interval)
print(credibility_interval)
