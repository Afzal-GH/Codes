# Load required packages
library(ggplot2)

# Data
day <- 1:10
number_treated <- c(25, 19, 17, 15, 20, 24, 30, 19, 16, 23)

# Calculate mean and standard deviation
mean_value <- mean(number_treated)
std_dev <- sd(number_treated)

# Set control limits
upper_control_limit <- mean_value + 3 * std_dev
lower_control_limit <- mean_value - 3 * std_dev

# Create control chart using ggplot2
control_chart <- ggplot(data = data.frame(day, number_treated),
                        aes(x = day, y = number_treated)) +
   geom_line() +
   geom_point(color = "blue") +
   geom_hline(yintercept = mean_value, linetype = "solid", color = "red") +
   geom_hline(yintercept = c(upper_control_limit, lower_control_limit),
              linetype = "dashed", color = "blue") +
   labs(title = "Control Chart for Daily Number of Visitors Treated by YPMS",
        x = "Day", y = "Number of Visitors Treated") +
   theme_minimal()

# Display the control chart
print(control_chart)
