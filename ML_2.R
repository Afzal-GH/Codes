# Load required libraries
library(dplyr)

# Given data
data <- data.frame(
   D = c("d0", "d0", "d1", "d1", "d1", "d1", "d0", "d1", "d1"),
   I = c("il", "i0", "il", "il", "i0", "i0", "i0", "il", "il"),
   G = c("g0", "g1", "g0", "g2", "g3", "g2", "g3", "g3", "g2"),
   S = c("s1", "s0", "s1", "s1", "s0", "s0", "s0", "s1", "s0"),
   L = c("l1", "l1", "l1", "l0", "l0", "l1", "l0", "l0", "l0")
)

# Function for Laplace smoothing
laplace_smooth <- function(counts, k) {
   (counts + 1) / (sum(counts) + k)
}

# Factor: P(D)
P_D <- table(data$D) / nrow(data)

# Factor: P(G | D)
P_G_D <- table(data$G, data$D) %>% laplace_smooth(1)

# Factor: P(G | I)
P_G_I <- table(data$G, data$I) %>% laplace_smooth(1)

# Factor: P(S | I)
P_S_I <- table(data$S, data$I) %>% laplace_smooth(1)

# Factor: P(L | G)
P_L_G <- table(data$L, data$G) %>% laplace_smooth(1)

# Display the factors
cat("P(D):\n", P_D, "\n\n")
cat("P(I | D):\n", P_G_D, "\n\n")
cat("P(G | I):\n", P_G_I, "\n\n")
cat("P(S | I):\n", P_S_I, "\n\n")
cat("P(L | G):\n", P_L_G, "\n\n")
