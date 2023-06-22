# Step 1: Prepare the data
years <- c(1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980)
intensities <- c(3.16, 2.29, 4.07, 4.57, 2.82, 2.24, 4.37, 6.03, 2.75)

# Step 2: Calculate the ranks and plotting positions
n <- length(intensities)
ranks <- seq(1, n)
plotting_positions <- ranks / (n + 1)

# Step 3: Compute the logarithms of the intensities
log_intensities <- log(intensities)

# Step 4: Fit a linear regression model to the logarithms
model <- lm(log_intensities ~ plotting_positions)

# Step 5: Get the estimated parameters of the log-normal distribution
log_mu <- coef(model)[1]
log_sigma <- coef(model)[2]

# Step 6: Compute the quantiles for return periods
return_period_25yr <- exp(log_mu + (1.96 * log_sigma))
return_period_7in <- qlogis(1 - 1/7, log_mu, log_sigma)

# Step 7: Compute the probabilities for the given intensity range
probability_4to6in <- plogis(log(6, base = exp(1)), log_mu, log_sigma) - plogis(log(4, base = exp(1)), log_mu, log_sigma)

# Step 8: Plot the log-normal frequency curve
plot(intensities, plotting_positions, pch = 16, xlab = "Intensity (in./hr)", ylab = "Plotting Position")
curve(plogis(log(x, base = exp(1)), log_mu, log_sigma), add = TRUE, col = "gold")
