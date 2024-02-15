# Given data
years_since_1970 <- c(0, 10, 20, 30, 40)  # Time (in years) since 1970
college_enrollment <- c(25.5, 30.3, 38.3, 45.6, 50.5)  # College enrollment percentages for females

# Perform cubic regression analysis
fit <- lm(college_enrollment ~ poly(years_since_1970, 3))

# Display the regression coefficients
coefficients <- round(coefficients(fit), digits = c(6, 4, 3, 1))
names(coefficients) <- c("a", "b", "c", "d")
print(coefficients)
