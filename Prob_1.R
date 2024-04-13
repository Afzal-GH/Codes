# Set the seed for reproducibility
set.seed(123)

# Function to simulate bidding process
simulate_bidding <- function(n_trials, distribution, params) {
   wins <- 0

   for (i in 1:n_trials) {
      bid <- 0

      if (distribution == "Uniform") {
         bid <- runif(1, params[1], params[2])
      } else if (distribution == "Normal") {
         bid <- rnorm(1, params[1], params[2])
      }

      if (bid <= params[3]) {
         wins <- wins + 1
      }
   }

   return(wins / n_trials)
}

# Simulation parameters
n_trials <- 1000

# Bid of $750,000
prob_750k <- simulate_bidding(n_trials, "Uniform", c(600000, 800000, 750000))
cat("The probability of winning the bid of $750,000 =", prob_750k, "\n")

# Bids of $775,000 and $785,000
prob_775k <- simulate_bidding(n_trials, "Uniform", c(600000, 800000, 775000))
prob_785k <- simulate_bidding(n_trials, "Uniform", c(600000, 800000, 785000))
cat("The probability of winning the bid of $775,000 =", prob_775k, "\n")
cat("The probability of winning the bid of $785,000 =", prob_785k, "\n")
