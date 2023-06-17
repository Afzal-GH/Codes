library(readxl)

data <- read_excel("DataSet.xlsx")

# Rename the column names to remove special characters
colnames(data) <- c("Weekly_Gross_Revenue", "Television_Advertising", "Newspaper_Advertising")

# Perform multiple linear regression
model <- lm(Weekly_Gross_Revenue ~ Television_Advertising + Newspaper_Advertising, data = data)

# Print the summary of the regression model
summary(model)

# Conduct hypothesis tests for the regression coefficients
# Overall significance of the model
anova(model)

# Significance of Television Advertising coefficient
summary(model)$coefficients["Television_Advertising", ]

# Significance of Newspaper Advertising coefficient
summary(model)$coefficients["Newspaper_Advertising", ]

# Calculate the expected revenue for the given advertising expenditures
new_data <- data.frame(Television_Advertising = 4.5, Newspaper_Advertising = 3.6)
predicted <- predict(model, newdata = new_data)
round(predicted, 0)
