# Set the shape and scale parameter
k <- 3
scale_parameters <- c(0.5, 1, 2, 3, 4, 5)

# Create a sequence of x values
x_values <- seq(0, 15, 0.1)

# Plot the gamma distribution for each scale parameter
par(mfrow = c(2, 3))  # Arrange plots in a 2x3 grid
for (scale_param in scale_parameters) {
   y_values <- dgamma(x_values, shape = k, scale = scale_param)
   plot(x_values, y_values, type = "l", main = paste("Scale =", scale_param),
        xlab = "x", ylab = "Probability Density",
        col = "blue", lwd = 2)
}
