# Load the library and dataset
library(readxl)
data <- read_excel("Dataset.xlsx")

# Display the structure of the dataset
str(data)

# Display summary statistics
summary(data)

# Calculate the mean account balance
mean_balance <- mean(data$X1)

# Count the number of customers with account balances exceeding Php 200,000
num_customers_above_200k <- sum(data$X1 > 200000)

# Plot a histogram of account balances
hist(data$X1, breaks = 10, xlab = "Account Balance (Php)", main = "Distribution of Account Balances")

# Calculate the mean and median balances for each branch
mean_balances <- tapply(data$X1, data$X6, mean)
median_balances <- tapply(data$X1, data$X6, median)

# Display the mean and median balances for each branch
branch_names <- c("Makati", "Manila", "Quezon City", "Pasig City")
branch_summary <- data.frame(Branch = branch_names, Mean_Balance = mean_balances, Median_Balance = median_balances)
print(branch_summary)

# Calculate the standard deviation of account balances
sd_balance <- sd(data$X1)

# Perform ANOVA to compare mean balances among branches
anova_result <- aov(X1 ~ X6, data = data)

# Display the ANOVA table
summary(anova_result)

# Calculate summary statistics for ATM use by customers with and without debit cards
atm_use_debit <- data$X2[data$X4 == 1]
atm_use_no_debit <- data$X2[data$X4 == 0]

# Perform t-test to compare ATM use between customers with and without debit cards
ttest_result <- t.test(atm_use_debit, atm_use_no_debit)

# Display the t-test result
print(ttest_result)

# Calculate summary statistics for ATM use by customers with and without interest-paying accounts
atm_use_interest <- data$X2[data$X5 == 1]
atm_use_no_interest <- data$X2[data$X5 == 0]

# Perform t-test to compare ATM use between customers with and without interest-paying accounts
ttest_result <- t.test(atm_use_interest, atm_use_no_interest)

# Display the t-test result
print(ttest_result)
