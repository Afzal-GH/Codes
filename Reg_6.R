# Data
year <- 2012:2023
Y <- c(102, 106, 108, 110, 122, 124, 128, 130, 142, 148, 150, 154)
X <- c(114, 118, 126, 130, 136, 140, 148, 156, 160, 164, 170, 178)

# Combine data into a data frame
data <- data.frame(year, Y, X)

# Number of observations
n <- length(Y)

# Calculate sums
sum_X <- sum(X)
sum_Y <- sum(Y)
sum_XY <- sum(X * Y)
sum_X2 <- sum(X^2)

# Calculate slope (beta1)
beta1 <- (n * sum_XY - sum_X * sum_Y) / (n * sum_X2 - sum_X^2)

# Calculate intercept (beta0)
beta0 <- (sum_Y - beta1 * sum_X) / n

# Print the coefficients
beta0
beta1

# Plot scatter diagram
plot(X, Y, xlab = "Disposable Income (X)", ylab = "Aggregate Consumption (Y)", main = "Scatter Diagram")

# Add regression line
abline(beta0, beta1, col = "red")

# Fit the regression model
model <- lm(Y ~ X)

# Compute residuals
residuals <- residuals(model)

# Compute mean squared error (MSE)
MSE <- sum(residuals^2) / (n - 2)

# Compute variances
s_u2 <- MSE
s_beta02 <- MSE * (1/n + (mean(X)^2) / (n * sum((X - mean(X))^2)))
s_beta12 <- MSE / sum((X - mean(X))^2)

# Print variances
s_u2
s_beta02
s_beta12
