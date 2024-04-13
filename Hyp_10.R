# Given values
alpha <- 0.05
beta <- 0.20
p1 <- 0.005
p2 <- 0.005 * (1 - 0.20)

# Z-scores for one-sided test
z_alpha <- qnorm(1 - alpha)
z_beta <- qnorm(1 - beta)

# Calculate sample size
n <- ((z_alpha + z_beta)^2 * (p1 * (1 - p1) + p2 * (1 - p2))) / (p1 - p2)^2

cat("The required sample size for each group is:", ceiling(n))
