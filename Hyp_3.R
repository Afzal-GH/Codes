# Load the necessary packages
library(readxl)

# Read the dataset from the Excel file
dataset <- read_excel("Dataset.xlsx")

# Summary statistics
summary(dataset)

# a) Distribution of individuals by employment status in current job
employment_counts <- table(dataset$EmploymentS)
barplot(employment_counts, main = "Distribution of Individuals by Employment Status",
        xlab = "Employment Status", ylab = "Count")

# b) Relationship between age and income
plot(dataset$Age, dataset$Income, main = "Relationship between Age and Income",
     xlab = "Age", ylab = "Income")

# Relationship between gender and income
gender_counts <- table(dataset$Sex)
income_by_gender <- tapply(dataset$Income, dataset$Sex, mean)
barplot(income_by_gender, main = "Mean Income by Gender",
        xlab = "Gender", ylab = "Mean Income")

# c) Variability in hours worked per week and gross annual income
var_hours <- var(dataset$HoursWPW)
var_income <- var(dataset$Income)
if (var_hours > var_income) {
   result <- "More variable: Hours worked per week"
} else {
   result <- "More variable: Gross annual income earned"
}
print(paste("Respondents are", result))

# d) Income inequality based on gender
income_by_gender <- tapply(dataset$Income, dataset$Sex, mean)
income_inequality <- abs(income_by_gender[2] - income_by_gender[1])
print(paste("Income inequality based on gender:", income_inequality))

# e) Hypothesis test for mean number of hours worked per week by females
female_hours <- dataset$HoursWPW[dataset$Sex == 2]
t.test(female_hours, mu = 40, alternative = "less")
