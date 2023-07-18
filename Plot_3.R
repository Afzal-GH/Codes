library(ggplot2)

# Car repair shop data
data <- data.frame(
   Ticket_No = c(1:30),
   Work = c(
      "Tires", "Lube oil", "Tires", "Battery", "Lube oil",
      "Lube oil", "Lube oil", "Brakes", "Lube oil", "Tires",
      "Brakes", "Lube oil", "Battery", "Lube oil", "Lube oil",
      "Tires", "Lube oil", "Brakes", "Tires", "Brakes",
      "Lube oil", "Brakes", "Lube oil", "Transmission", "Brakes",
      "Lube oil", "Battery", "Lube oil", "Brakes", "Tires"
   )
)

# Count the occurrences of each work type
work_counts <- table(data$Work)

# Create the check sheet
check_sheet <- data.frame(Work = names(work_counts), Count = as.vector(work_counts))
check_sheet <- check_sheet[order(check_sheet$Count, decreasing = TRUE), ]

# Compute the cumulative percentage
check_sheet$Cumulative_Percentage <- cumsum(check_sheet$Count) / sum(check_sheet$Count) * 100

# Create the Pareto diagram
ggplot(check_sheet, aes(x = Work, y = Count)) +
   geom_bar(stat = "identity", fill = "blue") +
   geom_line(aes(y = Cumulative_Percentage), color = "red") +
   geom_point(aes(y = Cumulative_Percentage), color = "red") +
   scale_y_continuous(sec.axis = sec_axis(~./max(check_sheet$Cumulative_Percentage) * 100, name = "Cumulative Percentage")) +
   labs(x = "Work", y = "Count", title = "Pareto Diagram") +
   theme_minimal()

# Print the check sheet
print(check_sheet)
