# Load required libraries
library(ggplot2)
library(forecast)
library(zoo)

# Create a data frame with the monthly sales data
sales <- data.frame(
   Month = rep(month.abb, 9),
   Year = rep(2001:2009, each = 12),
   Sales = c(139.7,114.3,101.6,152.4,215.9,228.6,215.9,190.5,177.8,139.7,139.7,152.4,
             165.1,177.8,177.8,203.2,241.3,279.4,292.1,317.5,203.2,177.8,165.1,177.8,
             177.8,203.2,228.6,279.4,317.5,330.2,368.3,355.6,241.3,215.9,215.9,203.2,
             228.6,254,266.7,342.9,355.6,406.4,444.5,431.8,330.2,330.2,304.8,292.1,
             266.7,317.5,368.3,431.8,457.2,571.5,546.1,482.6,431.8,406.4,393.7,406.4,
             431.8,457.2,457.2,482.6,533.4,622.3,660.4,520.7,508,482.6,457.2,431.8,
             381,406.4,431.8,457.2,495.3,584.2,609.6,558.8,508,495.3,444.5,419.1,
             431.8,444.5,495.3,533.4,558.8,647.7,673.1,660.4,609.6,584.2,520.7,482.6,
             495.3,533.4,635,673.1,749.3,812.8,800.1,736.6,685.8,635,622.3,622.3)
)

# Create the time series plot
ggplot(data = sales, aes(x = Year, y = Sales)) +
   geom_line() +
   labs(x = "Year", y = "Sales ($1,000s)") +
   ggtitle("DeBourgh Monthly Sales") +
   theme_minimal()


# Calculate the deseasonalized values using a 0.5 weighted moving average
deseasonalized <- sales$Sales / rollmean(sales$Sales, k = 4, fill = NA, align = "center", weights = c(0.5, 1, 1, 0.5))

# Create a data frame with the deseasonalized data
deseasonalized_data <- data.frame(Year = sales$Year, Deseasonalized = deseasonalized)

# Create the deseasonalized data plot with a trendline
ggplot(data = deseasonalized_data, aes(x = Year, y = Deseasonalized)) +
   geom_line() +
   geom_smooth(method = "lm", se = FALSE, color = "steelblue") +
   labs(x = "Year", y = "Deseasonalized Sales") +
   ggtitle("Deseasonalized Sales") +
   theme_minimal()


# Convert the sales data to a time series object
sales_ts <- ts(sales$Sales, frequency = 12, start = c(2001, 1))

# Forecast the sales for the year 2010
forecast_sales <- forecast(sales_ts, h = 12)

# Extract the forecasted values for January to December 2010
forecast_values <- as.numeric(forecast_sales$mean)

# Create a data frame with the forecasted values
forecast_data <- data.frame(
   Month = month.abb,
   Sales = forecast_values,
   Year = rep(2010, 12)
)

# Print the forecasted sales for January to December 2010
print(forecast_data)
