# Load the library
library(car)

# Step 1: Create the data frame
subject <- c("Poor", "Fair", "Good", "Excellent")
verbal_ability <- c(65, 68, 74, 79, 64, 72, 83, 84)
data_interpretation <- c(69, 71, 72, 69, 68, 73, 78, 78)
problem_solving <- c(75, 75, 70, 65, 78, 82, 76, 75)
scores <- data.frame(subject, verbal_ability, data_interpretation, problem_solving)

# Step 2: Perform the ANOVA analysis
anova_result <- aov(verbal_ability ~ subject, data = scores)
anova_table <- summary(anova_result)

# Step 3: Print the ANOVA table
print(anova_table)

# Step 4: Perform tests for assumptions
# Test for homogeneity of variances (Levene's test)
levene_test <- leveneTest(verbal_ability ~ subject, data = scores)
print(levene_test)

# Test for normality (Shapiro-Wilk test)
shapiro_test <- lapply(scores[, -1], shapiro.test)
print(shapiro_test)
