# Load the libraries
library(car)
library(MASS)

# Create the data frame
data <- data.frame(
   Patient = 1:23,
   Gender = c(1, 1, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1),
   Age = c(50, 36, 40, 41, 28, 49, 42, 45, 52, 29, 29, 43, 38, 34, 53, 36, 33, 29, 33, 55, 29, 44, 43),
   Severity_of_Illness = c(51, 46, 48, 44, 43, 54, 50, 48, 62, 50, 48, 53, 55, 51, 54, 49, 56, 46, 49, 51, 52, 58, 50),
   Anxiety_Level = c(2.3, 2.3, 2.2, 1.8, 1.8, 2.9, 2.2, 2.4, 2.9, 2.1, 2.4, 2.4, 2.2, 2.3, 2.2, 2, 2.5, 1.9, 2.1, 2.4, 2.3, 2.9, 2.3),
   Patient_Satisfaction = c(48, 57, 66, 70, 89, 36, 46, 54, 26, 77, 89, 67, 47, 51, 57, 66, 79, 88, 60, 49, 77, 52, 60)
)

# Fit the full regression model
full_model <- lm(Patient_Satisfaction ~ Gender + Age + Severity_of_Illness + Anxiety_Level, data = data)
summary(full_model)

# Check for outliers using the Bonferroni outlier test
outliers <- outlierTest(full_model)
outliers

# Check for influential points using the Cook's distance
influential_points <- cooks.distance(full_model)
influential_points

# Calculate the Variance Inflation Factor (VIF)
vif(full_model)

# Perform forward stepwise regression
forward_model <- stepAIC(full_model, direction = "forward")
summary(forward_model)

# Perform backward stepwise regression
backward_model <- stepAIC(full_model, direction = "backward")
summary(backward_model)

# Calculate the adjusted R-squared and MSE for each model
adjusted_r_squared_full <- summary(full_model)$adj.r.squared
mse_full <- sum(full_model$residuals^2) / full_model$df.residual

adjusted_r_squared_forward <- summary(forward_model)$adj.r.squared
mse_forward <- sum(forward_model$residuals^2) / forward_model$df.residual

adjusted_r_squared_backward <- summary(backward_model)$adj.r.squared
mse_backward <- sum(backward_model$residuals^2) / backward_model$df.residual

# Create the table
table <- data.frame(
   Model = c("Full", "Using Forward Stepwise", "Using Backward Stepwise"),
   Independent_Variables = c(length(coefficients(full_model))-1, length(coefficients(forward_model))-1, length(coefficients(backward_model))-1),
   Adjusted_R2 = c(adjusted_r_squared_full, adjusted_r_squared_forward, adjusted_r_squared_backward),
   MSE = c(sqrt(mse_full), sqrt(mse_forward), sqrt(mse_backward))
)
table
