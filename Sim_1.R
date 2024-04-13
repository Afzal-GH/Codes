# Given data points for Class C1
x1 <- matrix(c(1.7, 1.2, 1.5, 0.6, 0.5, 3.0, 3.5, 5.0, 4.5, 4.0), ncol = 2, byrow = TRUE)

# Given data points for Class C2
x2 <- matrix(c(1.1, 0.2, 1.5, 3.2, 4.0, -1.3, 3.5, 4.3, 0.8, 2.7), ncol = 2, byrow = TRUE)

# Generate new data points for Class C1
new_data_C1 <- mvrnorm(10, mean = colMeans(x1), sigma = cov(x1))

# Generate new data points for Class C2
new_data_C2 <- mvrnorm(10, mean = colMeans(x2), sigma = cov(x2))

# Set the mean for Class C3
mu3 <- colMeans(x1)

# Generate data points for Class C3
new_data_C3 <- mvrnorm(10, mean = mu3, sigma = cov(x1))
