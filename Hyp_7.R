library(readxl)

data <- read_xlsx("DataSet.xlsx")

subset_data <- subset(data, `High school Grade` == 1)

t_result <- t.test(subset_data$`Average class size`, mu = 40, alternative = "less")

test_statistic <- t_result$statistic

p_value <- t_result$p.value
