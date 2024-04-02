# Function to calculate MLE of theta
calculate_MLE <- function(sample_data) {
  n <- length(sample_data)
  theta_MLE <- n / sum(sample_data^3)
  return(theta_MLE)
}

# Set seed for reproducibility
set.seed(123)

# Number of iterations
iterations <- 1000

# True value of theta
theta_true <- 2

# Sample size
n <- 20

# Generate random samples and calculate MLE
MLE_estimates <- replicate(iterations, {
  sample_data <- rweibull(n, shape = 1/theta_true)
  calculate_MLE(sample_data)
})

# Calculate bias
bias <- mean(MLE_estimates) - theta_true

# Calculate variance
variance <- var(MLE_estimates)

# Output bias and variance
print(paste("Bias:", bias))
print(paste("Variance:", variance))
