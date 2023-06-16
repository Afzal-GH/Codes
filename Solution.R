# Load the necessary libraries
library(forecast)

# Create a data frame with the given data
data <- data.frame(
   Year = c(2010, 2010, 2010, 2010, 2011, 2011, 2011, 2011, 2012, 2012, 2012, 2012, 2013, 2013, 2013, 2013, 2014, 2014,
            2014, 2014, 2015, 2015, 2015, 2015, 2016, 2016, 2016, 2016, 2017, 2017, 2017, 2017, 2018, 2018, 2018),
   Quarter = c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2,
               3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3),
   Price = c(263600, 264100, 259500, 248900, 251400, 259200, 251400, 252000, 272300, 258600, 265500, 291200,
             290500, 302400, 322900, 331000, 324700, 344400, 327500, 355400, 347200, 341000, 330800, 370300,
             350800, 380000, 368600, 371100, 372500, 386300, 385500, 409700, 408000, 423400, 404300)
)

# Split the data into training and validation sets
train_data <- subset(data, Year <= 2016 & Quarter <= 4)
valid_data <- subset(data, Year >= 2017 & Quarter <= 3)

# Build linear trend model
lm_linear <- lm(Price ~ Year + Quarter, data = train_data)

# Build quadratic trend model
lm_quadratic <- lm(Price ~ Year + I(Year^2) + Quarter, data = train_data)

# Calculate RMSE for linear trend model on validation set
pred_linear <- predict(lm_linear, newdata = valid_data)
rmse_linear <- sqrt(mean((valid_data$Price - pred_linear)^2))

# Calculate RMSE for quadratic trend model on validation set
pred_quadratic <- predict(lm_quadratic, newdata = valid_data)
rmse_quadratic <- sqrt(mean((valid_data$Price - pred_quadratic)^2))

# Choose the best model based on RMSE
best_model <- ifelse(rmse_linear < rmse_quadratic, "Linear Trend Model", "Quadratic Trend Model")

# Re-estimate the best model using the entire data set
best_model_fit <- lm(Price ~ Year + Quarter, data = data)  # Use linear trend model

# Forecast home price in the fourth quarter of 2018
forecast_data <- data.frame(Year = 2018, Quarter = 4)
forecast_price <- predict(best_model_fit, newdata = forecast_data)

# Print the results
cat("Best Model:", best_model, "\n")
cat("Forecasted Home Price for Q4 2018:", forecast_price, "\n")
