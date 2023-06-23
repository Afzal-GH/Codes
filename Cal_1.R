# Given data
initial_population <- 1365533
final_population <- 1552258
number_of_years <- 5
target_population <- 50000000

# Calculate average annual growth rate (g)
g <- (final_population / initial_population)^(1 / number_of_years) - 1

# Calculate number of years required to reach 50,000,000 population
t <- log(target_population / final_population) / log(1 + g)

# Calculate population in 2005
population_2005 <- initial_population * (1 + g)^(20)

# Print the results
t
population_2005
