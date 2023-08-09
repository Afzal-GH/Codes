# Given data
data <- c(4, 0, 1, 2, 3, 0, 0, 1, 1, 0)
n <- length(data)
sample_mean <- mean(data)

# Given constraints
desired_probability <- 0.97

# Solving for beta using numerical optimization
solve_beta <- function(A) {
   sum_poisson <- sum(exp(-A) * A^(0:5) / factorial(0:5))
   return(sum_poisson - desired_probability)
}
beta <- uniroot(solve_beta, interval = c(0, 10))$root

# Calculating parameters for the posterior distribution
alpha_prior <- 2
alpha_post <- alpha_prior + n
beta_prior <- beta
beta_post <- beta_prior + n * sample_mean

# Calculating posterior credibility interval
quantile_lower <- qgamma(0.005, shape = alpha_post, rate = beta_post)
quantile_upper <- qgamma(0.995, shape = alpha_post, rate = beta_post)

# Predicting number of claims for next year with a 95% confidence interval
quantile_pred_lower <- qgamma(0.025, shape = alpha_post, rate = beta_post + 1)
quantile_pred_upper <- qgamma(0.975, shape = alpha_post, rate = beta_post + 1)

# Printing results
cat("Posterior Credibility Interval at 99%:", quantile_lower, "to", quantile_upper, "\n")
cat("Prediction for Next Year (95% CI):", quantile_pred_lower, "to", quantile_pred_upper, "\n")
