# Input the estimated coefficients
beta0 <- 2.5
beta1 <- -0.8
beta2 <- 0.3
beta3 <- -0.05

# Generate data
X <- seq(-10, 10, by = 0.1)
Y_hat <- beta0 + beta1*X + beta2*X^2 + beta3*X^3

# Plot the graph
plot(X, Y_hat, type = "l", xlab = "X", ylab = "Y", main = "Estimated Regression")
