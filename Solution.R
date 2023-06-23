# Function to calculate the probability of X ≥ 50 given a duration t
prob_X_50_or_more <- function(lambda, t) {
   p <- 1 - ppois(49, lambda * t)
   return(p)
}

# Average number of customers per hour
lambda <- 40

# Desired confidence level
confidence_level <- 0.90

# Initial duration
duration <- 1

# Find the minimum duration to satisfy the confidence level
while (prob_X_50_or_more(lambda, duration) < confidence_level) {
   duration <- duration + 1
}

# Output the minimum duration
cat("Minimum duration to be 90% confident that at least 50 customers entered the restaurant:", duration, "hour(s)\n")
