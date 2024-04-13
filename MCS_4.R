# Define the moment condition function
moment_condition <- function(mu, x, y) {
   return(mean(x * (y - mu)))
}

# Define the GMM criterion function
gmm_criterion <- function(mu, x, y, weight_matrix) {
   moments <- moment_condition(mu, x, y)
   return(t(moments) %*% weight_matrix %*% moments)
}

# Generate sample data
set.seed(1)
n <- 100
x <- rnorm(n)
y <- 2 + 3 * x + rnorm(n)

# Define the weighting matrix (inverse of the covariance matrix of X)
weight_matrix <- solve(cov(x))

# Find the GMM estimator using numerical optimization
gmm_estimator <- optim(par = 0, fn = gmm_criterion, x = x, y = y, weight_matrix = weight_matrix)

# Extract the estimated value of mu
mu_hat_gmm <- gmm_estimator$par

# Print the estimated value of mu
cat("GMM estimator for mu:", mu_hat_gmm)
