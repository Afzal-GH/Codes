# Given data
values <- c(1.459, 1.51, 1.408, 1.483, 1.47, 1.427, 1.431, 1.425, 1.473, 1.465,
            1.36, 1.494, 1.512, 1.479, 1.427, 1.457, 1.408, 1.417, 1.52, 1.442)
USL <- 1.5  # Upper specification limit

# Step 1: Calculate the moving ranges
MR <- abs(diff(values))

# Step 2: Calculate the average moving range
average_MR <- mean(MR)

# Step 3: Calculate CP
CP <- (USL - 0) / (6 * average_MR)

# Step 4: Calculate CPK
average <- mean(values)
CPK <- min((USL - average) / (3 * average_MR), (average - 0) / (3 * average_MR))

# Step 5: Calculate PP (Requires standard deviation)
standard_deviation <- sd(values)
PP <- (USL - 0) / (6 * standard_deviation)

# Step 6: Calculate PPK (Requires standard deviation)
PPK <- min((USL - average) / (3 * standard_deviation), (average - 0) / (3 * standard_deviation))

# Step 7: Calculate Z-score (Requires standard deviation and target value)
target <- 0  # Change this value if a specific target is provided
Z_score <- (average - values) / standard_deviation

# Print the results
cat("Average:", average, "\n")
cat("Standard Devation:", standard_deviation, "\n")
cat("Average Moving Range (MR):", average_MR, "\n")
cat("CP:", CP, "\n")
cat("CPK:", CPK, "\n")
cat("PP:", PP, "\n")
cat("PPK:", PPK, "\n")
cat("Z-score:", Z_score)
