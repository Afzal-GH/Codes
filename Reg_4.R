# Input data
x <- c(18, 26, 41, 35, 56, 46, 33, 19, 14, 10, 25, 21, 29)
y <- c(69, 81, 85, 77, 95, 93, 86, 81, 75, 76, 83, 86, 90)

# Number of observations
n <- length(x)

# Calculate necessary sums
sum_x <- sum(x)
sum_y <- sum(y)
sum_xy <- sum(x * y)
sum_x_squared <- sum(x^2)

# Calculate coefficients (b1 and b0)
b1 <- (n * sum_xy - sum_x * sum_y) / (n * sum_x_squared - sum_x^2)
b0 <- (sum_y - b1 * sum_x) / n

# Linear regression equation
linear_regression_equation <- paste("y =", round(b0, 3), "+", round(b1, 3), "x")

# Calculate predicted values
y_hat <- b0 + b1 * x

# Calculate total sum of squares (TSS)
mean_y <- mean(y)
TSS <- sum((y - mean_y)^2)

# Calculate residual sum of squares (RSS)
RSS <- sum((y - y_hat)^2)

# Calculate R-squared (coefficient of determination)
R_squared <- 1 - (RSS / TSS)

# Predict for x = 44
x_new <- 44
y_predicted <- b0 + b1 * x_new

# Print results
cat("Coefficients:\n")
cat("b0 =", round(b0, 3), "\n")
cat("b1 =", round(b1, 3), "\n\n")

cat("Linear Regression Equation:\n")
cat(linear_regression_equation, "\n\n")

cat("R-squared (Percentage of variation explained by the regression line):\n")
cat(round(R_squared * 100, 2), "%\n\n")

cat("Predicted value for x = 44:\n")
cat("y_hat =", round(y_predicted, 3), "\n")
