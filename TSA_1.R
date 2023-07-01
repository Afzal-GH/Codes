# Load the 'forecast' package
library(forecast)

# Create a time series object
y <- c(362, 381, 317, 297, 399, 402, 375, 349, 386, 328, 389, 343, 276, 334, 384, 314, 344, 337, 345, 362, 314, 365)
ts_data <- ts(y, frequency = 12)

# Exponential Smoothing forecast
es_forecast <- forecast(ets(ts_data))

# Holt's Trend Corrected Exponential Smoothing forecast
holt_forecast <- forecast(holt(ts_data))

# Holt's Winter Method forecast
winter_forecast <- forecast(hw(ts_data, seasonal = "additive"))

# Print the forecasts
print("Exponential Smoothing forecast:")
print(es_forecast)
print("Holt's Trend Corrected Exponential Smoothing forecast:")
print(holt_forecast)
print("Holt's Winter Method forecast:")
print(winter_forecast)
