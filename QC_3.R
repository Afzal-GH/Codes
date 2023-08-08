# Given data
lot_number <- c(1, 2, 3, 4, 5, 6, 7)
number_of_defectives <- c(12, 16, 10, 15, 10, NA, 12)

# Remove NA from the data
data <- data.frame(lot_number, number_of_defectives)
data <- na.omit(data)

# Calculate mean and standard deviation
n <- nrow(data)
mean_defectives <- mean(data$number_of_defectives)
sigma_defectives <- sd(data$number_of_defectives)

# Calculate control limits
UCL <- mean_defectives + 3 * sigma_defectives
LCL <- mean_defectives - 3 * sigma_defectives

# Plot the control chart
plot(data$lot_number, data$number_of_defectives, type = "o",
     ylim = c(3, 22),
     xlab = "Lot Number", ylab = "Number of Defectives",
     main = "Control Chart",
     col = "blue")
abline(h = c(UCL, LCL), col = "red", lty = 2)
legend("topright", legend = c("UCL", "LCL"), col = "red", lty = 2)

# Find the value of k
k <- seq(5, 18, by = 1)
for (i in k) {
   temp_data <- data.frame(lot_number = c(1, 2, 3, 4, 5, 7),
                           number_of_defectives = c(12, 16, 10, 15, 10, i))
   temp_mean <- mean(temp_data$number_of_defectives)
   temp_sigma <- sd(temp_data$number_of_defectives)
   if (temp_mean - 3 * temp_sigma >= LCL && temp_mean + 3 * temp_sigma <= UCL) {
      print(paste("The value of k that makes the process under control is:", i))
      break
   }
}
