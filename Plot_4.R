# Function to calculate blocking probability
blocking_probability <- function(rho, N) {
   return(rho^N * (1 - rho) / (1 - rho^(N+1)))
}

# Function to calculate normalized throughput
normalized_throughput <- function(rho, N) {
   pb <- blocking_probability(rho, N)
   return(rho * (1 - pb))
}

# Values of rho from 0 to 1 (you can change this as needed)
rho_values <- seq(0, 1, by = 0.01)

# Values of N (system capacity)
N_values <- c(4, 19)

# Plot blocking probability for different values of N
plot(rho_values, blocking_probability(rho_values, N_values[1]), type = "l", col = "blue",
     xlab = "Traffic Intensity (rho)", ylab = "Blocking Probability (P_B)",
     main = "Blocking Probability vs. Traffic Intensity for different N",
     ylim = c(0, 1))
lines(rho_values, blocking_probability(rho_values, N_values[2]), col = "red")
legend("topright", legend = paste("N =", N_values), col = c("blue", "red"), lty = 1)

# Plot normalized throughput for different values of N
plot(rho_values, normalized_throughput(rho_values, N_values[1]), type = "l", col = "blue",
     xlab = "Traffic Intensity (rho)", ylab = "Normalized Throughput (gamma / mu)",
     main = "Normalized Throughput vs. Traffic Intensity for different N")
lines(rho_values, normalized_throughput(rho_values, N_values[2]), col = "red")
legend("topright", legend = paste("N =", N_values), col = c("blue", "red"), lty = 1)
