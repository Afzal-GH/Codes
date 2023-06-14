# Create the data frame
df <- data.frame(
   Period = 1:20,
   Price = c(82.92, 83.67, 82.36, 82.42, 82.79, 83.63, 84.21, 84.53, 85.42, 86.21,
             86.7, 87.65, 87.37, 87.91, 88.41, 88.25, 89.6, 88.89, 88.07, 88.61)
)

# Fir the linear regression model
model <- lm(Price ~ Period, data = df)

# Display the model summary
summary(model)

# Load the lmtest package
library(lmtest)

# Perform the Dublin-Watson test
dwtest(model)
