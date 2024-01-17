# Given data
data <- list(c(13, 13, 13, 18),
             c(14, 17, 14, 16, 19),
             c(21, 12, 17, 21, 19),
             c(19, 16, 14))

# Create a dot plot
stripchart(data, method = "stack", pch = 16, main = "Dot Plot", xlab = "Groups", ylab = "Values", col = 1:4)
