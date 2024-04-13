# Given parameters
pi_1 <- 1/3
pi_2 <- 2/3
mu_1 <- c(-3, 2)
mu_2 <- c(2, 1)
sigma_inv <- matrix(c(5, -2, -2, 2), nrow = 2, ncol = 2, byrow = TRUE)

# Test points
A <- c(3, log2(2)/12)
B <- c(-log2(2)/27, 5)
C <- c(-1 - log2(2)/27, 3/8)

# Calculate discriminant function for each class
delta_1 <- log(pi_1) + 0.5 * t(mu_1) %*% sigma_inv %*% mu_1 - t(mu_1) %*% sigma_inv %*% A
delta_2 <- log(pi_2) + 0.5 * t(mu_2) %*% sigma_inv %*% mu_2 - t(mu_2) %*% sigma_inv %*% A

# Classify test point A
if (delta_1 > delta_2) {
   class_A <- 1
} else {
   class_A <- 2
}

# Repeat the same process for test points B and C

# Calculate discriminant function for test point B
delta_1 <- log(pi_1) + 0.5 * t(mu_1) %*% sigma_inv %*% mu_1 - t(mu_1) %*% sigma_inv %*% B
delta_2 <- log(pi_2) + 0.5 * t(mu_2) %*% sigma_inv %*% mu_2 - t(mu_2) %*% sigma_inv %*% B

# Classify test point B
if (delta_1 > delta_2) {
   class_B <- 1
} else {
   class_B <- 2
}

# Calculate discriminant function for test point C
delta_1 <- log(pi_1) + 0.5 * t(mu_1) %*% sigma_inv %*% mu_1 - t(mu_1) %*% sigma_inv %*% C
delta_2 <- log(pi_2) + 0.5 * t(mu_2) %*% sigma_inv %*% mu_2 - t(mu_2) %*% sigma_inv %*% C

# Classify test point C
if (delta_1 > delta_2) {
   class_C <- 1
} else {
   class_C <- 2
}

# Print the results
print(paste("Test point A belongs to class:", class_A))
print(paste("Test point B belongs to class:", class_B))
print(paste("Test point C belongs to class:", class_C))
