# Load the Matrix package
library(Matrix)

# Define the infinitesimal generator matrix Q
Q <- matrix(c(-2, 2, 0, 2, -4, 2, 0, 2, -2), nrow = 3, byrow = TRUE)

# Calculate the matrix exponential e^(tQ)
t <- 1  # Time parameter
exp_tQ <- expm(t * Q)

# Extract p_t(1, 3)
p_t_1_3 <- exp_tQ[1, 3]

p_t_1_3

# Define the transition probability matrix P
P <- matrix(c(0, 1/2, 1/2, 1/2, 0, 1/2, 1/2, 1/2, 0), nrow = 3, byrow = TRUE)

# Calculate P^2
P_squared <- P %*% P

# Extract P(X(3) = 3|X(2) = 1)
P_X3_3_given_X2_1 <- P_squared[1, 3]

P_X3_3_given_X2_1
