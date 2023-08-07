# Accept-Reject algorithm with error handling
accept_reject_algorithm <- function(n) {
   samples <- numeric(n)
   i <- 1

   while (i <= n) {
      theta <- generate_cauchy_sample(1)
      u <- runif(1)
      ratio <- target_distribution(theta, x) / (cauchy_candidate(theta))

      if (is.finite(ratio) && u <= ratio) {
         samples[i] <- theta
         i <- i + 1
      }
   }
   return(samples)
}

# Generate 1000 samples from the posterior distribution using Accept-Reject algorithm
n <- 1000
x <- 2  # Replace this with your observed data
posterior_samples <- accept_reject_algorithm(n)

# Compute the estimator (mean of the accepted samples)
estimator <- mean(posterior_samples)

# Print the estimator
print(estimator)
