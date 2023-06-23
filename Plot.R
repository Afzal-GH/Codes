set.seed(786)

n_values <- seq(100, 10000, by = 100)  # Values of n
p_values <- seq(0.1, 0.9, by = 0.2)  # Values of p

standard_deviations <- matrix(0, nrow = length(n_values), ncol = length(p_values))

for (i in 1:length(n_values)) {
   n <- n_values[i]
   for (j in 1:length(p_values)) {
      p <- p_values[j]
      Y <- rbinom(n, n, p)
      Z <- cos(2 * pi * Y / n)
      standard_deviations[i, j] <- sd(Z)
   }
}

plot(1 / sqrt(n_values), standard_deviations[, 1], type = "l", xlab = "1/sqrt(n)", ylab = "Standard Deviation",
     main = "Standard Deviation of Z_n vs 1/sqrt(n) for p = 0.1")
for (j in 2:length(p_values)) {
   lines(1 / sqrt(n_values), standard_deviations[, j], col = j)
}
legend("topright", legend = p_values, title = "p", col = 1:length(p_values), lty = 1)
