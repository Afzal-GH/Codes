# Load the necessary libraries
library(openxlsx)
library(urca)

# Load the dataset from the Excel file
data <- read.xlsx("dataset.xlsx")

# Convert the data to a time series object
ts_data <- ts(data$B, start = 1985)

# Perform the ADF (Augmented Dickey-Fuller) test
adf_test <- ur.df(ts_data, type = "drift", selectlags = "AIC")
summary(adf_test)

# Perform the PP (Phillips-Perron) test
pp_test <- ur.pp(ts_data, type = "Z-tau")
summary(pp_test)

# Perform the DF-GLS (Dickey-Fuller Generalized Least Squares) test
dfgls_test <- ur.ers(ts_data, type = "DF-GLS")
summary(dfgls_test)
