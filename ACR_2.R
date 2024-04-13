# Set the random seed for reproducibility
set.seed(786)

# Simulate 100 observations for AR(2) process with parameters 0.2 and 0.6
ar1 <- arima.sim(list(order = c(2, 0, 0), ar = c(0.2, 0.6)), n = 100)

# Plot the trace of the simulated AR(2) process
plot(ar1, type = "l", main = "Trace Plot - AR(2) with Parameters 0.2 and 0.6")

# Plot the autocorrelation function (ACF) of the simulated AR(2) process
acf(ar1, main = "ACF Plot - AR(2) with Parameters 0.2 and 0.6")

# Simulate 100 observations for AR(2) process with parameters 0.2 and -0.6
ar2 <- arima.sim(list(order = c(2, 0, 0), ar = c(0.2, -0.6)), n = 100)

# Plot the trace of the second simulated AR(2) process
plot(ar2, type = "l", main = "Trace Plot - AR(2) with Parameters 0.2 and -0.6")

# Plot the ACF of the second simulated AR(2) process
acf(ar2, main = "ACF Plot - AR(2) with Parameters 0.2 and -0.6")
