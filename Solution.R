library(deSolve)

# Define the ODE system
ode_system <- function(t, y, params) {
   with(as.list(c(y, params)), {
      dV <- pi * (1 - (t^2)/900) * y[1]
      dU <- pi * (t^2)/900 * y[1]
      return(list(c(dV, dU)))
   })
}

# Solve the ODEs for different values of pi
pi_values <- seq(800, 1000, by = 1)
V30_values <- rep(0, length(pi_values))
U30_values <- rep(0, length(pi_values))

for (i in 1:length(pi_values)) {
   params <- list(pi = pi_values[i])
   y0 <- c(0, 0) # Initial values for V and U
   t <- seq(0, 30, by = 0.01) # Time grid
   ode_result <- ode(y = y0, times = t, func = ode_system, parms = params)
   V30_values[i] <- ode_result[ode_result$time == 30, "V1"]
   U30_values[i] <- ode_result[ode_result$time == 30, "V2"]
}

# Find the value of pi that satisfies V30 + U30 = 100,000 (approximately)
target <- 100000
index <- which(abs(V30_values + U30_values - target) < 1000)
pi_solution <- pi_values[index]

# Plot the solutions V_t and U_t for the obtained pi_solution
params <- list(pi = pi_solution)
y0 <- c(0, 0) # Initial values for V and U
t <- seq(0, 30, by = 0.01) # Time grid
ode_result <- ode(y = y0, times = t, func = ode_system, parms = params)

plot(t, ode_result[, "V1"], type = "l", xlab = "Time", ylab = "V_t",
     main = "Unit-Linked Insurance: V_t over Time")
lines(t, ode_result[, "V2"], col = "blue")
legend("topright", legend = c("V_t", "U_t"), col = c("black", "blue"), lty = 1)
