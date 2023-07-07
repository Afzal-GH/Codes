# Load the required library
library(readxl)

# Read the data from the Excel file
data <- read_excel("DataSet.xlsx")

# Calculate the average hours of exercise per week by sex
average_hours <- aggregate(Hours_of_exercise_per_week ~ Sex, data, mean)

# Calculate the percentage of women who do more than 5 hours of exercise per week
women_gt_5 <- sum(data$Sex == "Female" & data$Hours_of_exercise_per_week > 5) / sum(data$Sex == "Female") * 100

# Calculate the percentage of men who do not exercise
men_no_exercise <- sum(data$Sex == "Male" & data$Hours_of_exercise_per_week == 0) / sum(data$Sex == "Male") * 100

# Create a pie chart of average hours of exercise per week by sex
pie(average_hours$Hours_of_exercise_per_week, labels = average_hours$Sex, main = "Average Hours of Exercise per Week by Sex")

# Print the results
cat("Average hours of exercise per week by sex:\n")
print(average_hours)
cat("Percentage of women who do more than 5 hours of exercise per week: ", women_gt_5, "%\n")
cat("Percentage of men who do not exercise: ", men_no_exercise, "%\n")
