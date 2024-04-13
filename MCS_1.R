# Create the x and y variables
x <- c(4, 5, 7, 8, 10, 12, 12, 22)
y <- c(12, 14, 16, 16, 18, 20, 24, 20)

# Combine x and y into a data frame
data <- data.frame(x, y)

# Fit a linear regression model
model <- lm(y ~ x, data = data)

# Compute the residuals
residuals <- residuals(model)

# Compute the standardized residuals
std_residuals <- rstandard(model)

# Print the standardized residuals
std_residuals

# Compute the leverage values
leverage <- hatvalues(model)

# Calculate the threshold
threshold <- 6 / length(data$x)

# Print the leverage values and identify influential observations
leverage
threshold
