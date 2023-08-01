data <- c(0, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0,
          0, 0, 2, 0, 1, 0, 0, 0, 4, 1, 0, 0, 1, 0, 0, 0, 1, 0)

relative_freq <- table(data) / length(data)

barplot(relative_freq, main = "Relative Frequency Bar Plot", xlab = "Number of Times Taken on Sunday",
        ylab = "Relative Frequency", col = "steelblue")
