# Load the necessary libraries
library(openxlsx)

# Load the dataset from the Excel file
data <- read.xlsx("dataset.xlsx")

# Extract the columns for Set 1 and Set 2
set1 <- data$Set1
set2 <- data$Set2
set3 <- data$Set3

# Calculate the frequency and relative frequency for Set 1 and Set 2
freq_set1 <- table(set1)
rel_freq_set1 <- freq_set1 / sum(freq_set1)

freq_set2 <- table(set2)
rel_freq_set2 <- freq_set2 / sum(freq_set2)

# Create a bar plot for the frequency distributions of Set 1 and Set 2
par(mfrow = c(1, 2))
barplot(freq_set1, main = "Frequency Distribution - Set 1", xlab = "IQ Scores", ylab = "Frequency", col = "skyblue")
barplot(freq_set2, main = "Frequency Distribution - Set 2", xlab = "IQ Scores", ylab = "Frequency", col = "lightgreen")

# Create a bar plot for the relative frequency distributions of Set 1 and Set 2
par(mfrow = c(1, 2))
barplot(rel_freq_set1, main = "Relative Freq. Distribution - Set 1", xlab = "IQ Scores", ylab = "Relative Frequency", col = "skyblue")
barplot(rel_freq_set2, main = "Relative Freq. Distribution - Set 2", xlab = "IQ Scores", ylab = "Relative Frequency", col = "lightgreen")

# Create a bar plot for the relative frequency distribution of Set 3
rel_freq_set3 <- table(set3) / length(set3)
barplot(rel_freq_set3, main = "Relative Freq. Distribution - Set 3", xlab = "Number of Times Taken on Sunday",
        ylab = "Relative Frequency", col = "#636363")
