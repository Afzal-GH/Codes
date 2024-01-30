# a) Calculate E(T) and Var(T)
a <- 0.5
b <- 3
E_Y <- 30
Var_Y <- 16

E_T <- a * E_Y + b
Var_T <- a^2 * Var_Y

# b) Calculate P(8.5 <= T <= 10)
Z_8.5 <- (8.5 - E_T) / sqrt(Var_T)
Z_10 <- (10 - E_T) / sqrt(Var_T)
P_8.5_to_10 <- pnorm(Z_10) - pnorm(Z_8.5)

# c) Calculate P(T > 21)
Z_21 <- (21 - E_T) / sqrt(Var_T)
P_T_gt_21 <- 1 - pnorm(Z_21)

# d) Calculate P(14 <= T <= 20)
Z_14 <- (14 - E_T) / sqrt(Var_T)
Z_20 <- (20 - E_T) / sqrt(Var_T)
P_14_to_20 <- pnorm(Z_20) - pnorm(Z_14)
