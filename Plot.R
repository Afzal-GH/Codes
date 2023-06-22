# Metropolis-Hastings algorithm
metropolis_hastings <- function(N, initial_value, proposal_type, proposal_param) {
   x <- numeric(N)
   x[1] <- initial_value

   for (i in 2:N) {
      if (proposal_type == "Gaussian") {
         candidate <- rnorm(1, mean = x[i-1], sd = proposal_param)
      } else if (proposal_type == "Uniform") {
         candidate <- runif(1, min = x[i-1] - proposal_param, max = x[i-1] + proposal_param)
      }

      acceptance_prob <- min(1, p(candidate) / p(x[i-1]))

      if (!is.na(acceptance_prob) && runif(1) < acceptance_prob) {
         x[i] <- candidate
      } else {
         x[i] <- x[i-1]
      }
   }
   return(x)
}

# Set the parameters
N <- 10000  # Number of iterations
initial_value <- 0  # Initial value of the Markov chain

# Metropolis-Hastings with Gaussian proposal
sigma <- 1  # Standard deviation of the Gaussian proposal
sample_MCMC_partA <- metropolis_hastings(N, initial_value, "Gaussian", sigma)

# Metropolis-Hastings with Uniform proposal
alpha <- 1  # Width of the Uniform proposal
sample_MCMC_partB <- metropolis_hastings(N, initial_value, "Uniform", alpha)

# Plot the MCMC samples
plot(sample_MCMC_partA, type = "l", xlab = "Iteration", ylab = "Sample", main = "MCMC Sample (Gaussian Proposal)")
plot(sample_MCMC_partB, type = "l", xlab = "Iteration", ylab = "Sample", main = "MCMC Sample (Uniform Proposal)")

# Plot the trace plots
plot(sample_MCMC_partA, type = "l", xlab = "Iteration", ylab = "Sample", main = "Trace Plot (Gaussian Proposal)")
plot(sample_MCMC_partB, type = "l", xlab = "Iteration", ylab = "Sample", main = "Trace Plot (Uniform Proposal)")
