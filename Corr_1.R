# Given data
force <- c(0, 20, 40, 60, 80)
length <- c(8, 100, 215, 310, 400)

# (a) Scatter plot
plot(force, length, xlab = "Force (N)", ylab = "Length (mm)", main = "Scatter Plot")

# (b) Estimate length for a force of 57N
estimated_length <- approx(force, length, xout = 57)$y
estimated_length

# (c) Regression analysis
regression <- lm(length ~ force)
summary(regression)

# (d) Correlation coefficient
correlation <- cor(force, length)
correlation

# (e) Interpretation of correlation coefficient
interpretation <- switch(
   TRUE,
   correlation > 0.7 ~ "Strong positive correlation",
   correlation > 0.3 ~ "Moderate positive correlation",
   correlation > -0.3 ~ "Weak or no correlation",
   correlation > -0.7 ~ "Moderate negative correlation",
   TRUE ~ "Strong negative correlation"
)
interpretation

# (f) Predict length for a force of 57N using regression equation
predicted_length <- predict(regression, newdata = data.frame(force = 57))
predicted_length

# (g) Compare predicted length with estimated length from scatter plot
comparison <- data.frame(Estimated_Length = estimated_length, Predicted_Length = predicted_length)
comparison
