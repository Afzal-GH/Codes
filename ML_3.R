# Function to calculate binomial coefficient
choose <- function(n, k) {
   factorial(n) / (factorial(k) * factorial(n - k))
}

# Function to calculate P[reject] for a given p, n, and c
preject <- function(p, n, c) {
   sum(choose(n, (c + 1):n) * p^(c + 1:n) * (1 - p)^(n - (c + 1:n)))
}

# Function to calculate AOQ for a given p, n
aoq <- function(p, n) {
   sum((0:n) * choose(n, 0:n) * p^0:n * (1 - p)^(n - 0:n))
}

# Parameters
n <- 50  # sample size
c <- 0   # acceptance number

# Range of lot fraction defective values (p)
p_values <- seq(0, 1, by = 0.01)

# Calculate P[reject] and AOQ for each p
preject_values <- sapply(p_values, preject, n = n, c = c)
aoq_values <- sapply(p_values, aoq, n = n)

# Plot OC Curve
plot(p_values, 1 - preject_values, type = "l", col = "blue", xlab = "Lot Fraction Defective (p)",
     ylab = "P[accept]", main = "Operating Characteristic (OC) Curve")

# Plot AOQ Curve
plot(p_values, aoq_values, type = "l", col = "grey", xlab = "Lot Fraction Defective (p)",
     ylab = "Average Outgoing Quality (AOQ)", main = "Average Outgoing Quality (AOQ) Curve")

# Find AQL and AOQL values
aql_index <- which.max(1 - preject_values >= 0.95)
aql <- p_values[aql_index]
aoql <- aoq_values[aql_index]

# Mark AQL and AOQL on the OC curve
points(aql, 0.95, col = "red", pch = 19)
text(aql, 0.95, sprintf(" AQL\n(p = %.2f)", aql), pos = 4)

# Mark AOQL on the AOQ curve
points(aql, aoql, col = "red", pch = 19)
text(aql, aoql, sprintf(" AOQL\n(AOQ = %.2f)", aoql), pos = 4)
