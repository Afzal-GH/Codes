# Data for video treatment group
x1 <- c(4.44)
s1 <- 1.02
n1 <- 24

# Data for control group
x2 <- c(5.07)
s2 <- 0.98
n2 <- 27

# Degrees of freedom
df <- n1 + n2 - 2

# Critical value for 90% confidence interval
critical_value <- qt(0.95, df)

# Standard error of the difference in means
standard_error <- sqrt((s1^2 / n1) + (s2^2 / n2))

# Confidence interval
confidence_interval <- c(x1 - x2) + c(-1, 1) * critical_value * standard_error

confidence_interval
