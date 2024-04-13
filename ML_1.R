# Load the necessary packages
library(readxl)
library(factoextra)

# Read the data from the Excel file
data <- read_excel("~/Data/Dummy/MBA.xlsx")

# Extract relevant columns for clustering
clustering_data <- data[, -1]

# Perform K-Means clustering with 4 clusters
set.seed(123)  # Set seed for reproducibility
kmeans_result <- kmeans(clustering_data, centers = 4, nstart = 25)

# Add cluster assignment to the original data
data$Cluster <- as.factor(kmeans_result$cluster)

# Visualize the clusters using a scatterplot matrix
fviz_cluster(kmeans_result, data = clustering_data,
             title = "K-Means Clustering - MBA Programs") +
   theme_minimal()

# Display summary of the clustering
summary(kmeans_result)

# Print the cluster centers
kmeans_result$centers
