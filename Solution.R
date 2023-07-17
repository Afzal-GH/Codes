# Create the data
Year <- c(1, 2, 3, 4, 5)
Quarter1 <- c(4, 6, 10, 13, 19)
Quarter2 <- c(2, 4, 3, 9, 10)
Quarter3 <- c(1, 4, 5, 7, 13)
Quarter4 <- c(5, 14, 16, 22, 35)
TotalSales <- c(12, 28, 34, 51, 77)

# Combine the data into a data frame
data <- data.frame(Year, Quarter1, Quarter2, Quarter3, Quarter4, TotalSales)

# Create the dummy variables
x1 <- ifelse(data$Year == 1, 1, 0)
x2 <- ifelse(data$Year == 2, 1, 0)
x3 <- ifelse(data$Year == 3, 1, 0)

# Perform the regression analysis
model <- lm(TotalSales ~ x1 + x2 + x3, data=data)

# Extract the estimated regression coefficients
coefficients <- coef(model)

# Compute the quarterly forecasts for next year
forecast_q1 <- round(coefficients[1] + coefficients[2], 0)
forecast_q2 <- round(coefficients[1] + coefficients[3], 0)
forecast_q3 <- round(coefficients[1] + coefficients[4], 0)
forecast_q4 <- round(coefficients[1], 0)

# Print the results
cat("Estimated regression equation: Y_hat =", coefficients[1], coefficients[2], "* x1 ",
    coefficients[3], "* x2 ", coefficients[4], "* x3\n")
cat("Quarterly forecasts for next year:\n")
cat("Forecast for quarter 1:", forecast_q1, "pianos\n")
cat("Forecast for quarter 2:", forecast_q2, "pianos\n")
cat("Forecast for quarter 3:", forecast_q3, "pianos\n")
cat("Forecast for quarter 4:", forecast_q4, "pianos\n")
