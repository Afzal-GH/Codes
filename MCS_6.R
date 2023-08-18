# Given data for income distributions
income_A <- c(100, 250, 200, 300, 150, 500, 550, 400, 450, 350)
income_B <- c(310, 350, 510, 150, 390, 190, 270, 470, 230, 430)
income_C <- c(425, 535, 205, 480, 150, 370, 645, 590, 315, 260)

# Calculate cumulative probabilities
cum_prob_A <- cumsum(income_A) / sum(income_A)
cum_prob_B <- cumsum(income_B) / sum(income_B)
cum_prob_C <- cumsum(income_C) / sum(income_C)

# Plot Lorenz curves
library(ggplot2)

data_lorenz <- data.frame(Cumulative_Prob = c(0, cum_prob_A, 1), Income_A = c(0, cum_prob_A, 1), Income_B = c(0, cum_prob_B, 1), Income_C = c(0, cum_prob_C, 1))

ggplot(data_lorenz, aes(x = Cumulative_Prob)) +
   geom_line(aes(y = Income_A, color = "Country A"), size = 1) +
   geom_line(aes(y = Income_B, color = "Country B"), size = 1) +
   geom_line(aes(y = Income_C, color = "Country C"), size = 1) +
   labs(title = "Lorenz Curves of Income Distributions",
        x = "Cumulative Probability", y = "Cumulative Income") +
   scale_color_manual(values = c("blue", "green", "red"), labels = c("Country A", "Country B", "Country C")) +
   theme_minimal()

# Calculate Gini coefficients
gini_A <- 1 - 2 * sum(cum_prob_A * (1 - cum_prob_A))
gini_B <- 1 - 2 * sum(cum_prob_B * (1 - cum_prob_B))
gini_C <- 1 - 2 * sum(cum_prob_C * (1 - cum_prob_C))

# Calculate generalized Gini coefficients
gen_gini_A <- 2 * sum(abs(cum_prob_A - 0.5) * income_A) / sum(income_A)
gen_gini_B <- 2 * sum(abs(cum_prob_B - 0.5) * income_B) / sum(income_B)
gen_gini_C <- 2 * sum(abs(cum_prob_C - 0.5) * income_C) / sum(income_C)

# Perform analyses
stochastic_dominance_AB <- ifelse(all(cum_prob_A <= cum_prob_B), "First-Order Stochastic Dominance", "Not First-Order Stochastic Dominance")
stochastic_dominance_AC <- ifelse(all(cum_prob_A <= cum_prob_C), "First-Order Stochastic Dominance", "Not First-Order Stochastic Dominance")
stochastic_dominance_BC <- ifelse(all(cum_prob_B <= cum_prob_C), "First-Order Stochastic Dominance", "Not First-Order Stochastic Dominance")

lorenz_dominance_AB <- ifelse(gini_A <= gini_B, "Generalized Lorenz Dominance", "Not Generalized Lorenz Dominance")
lorenz_dominance_AC <- ifelse(gini_A <= gini_C, "Generalized Lorenz Dominance", "Not Generalized Lorenz Dominance")
lorenz_dominance_BC <- ifelse(gini_B <= gini_C, "Generalized Lorenz Dominance", "Not Generalized Lorenz Dominance")

relative_lorenz_dominance_AB <- ifelse(gen_gini_A <= gen_gini_B, "Relative Lorenz Dominance", "Not Relative Lorenz Dominance")
relative_lorenz_dominance_AC <- ifelse(gen_gini_A <= gen_gini_C, "Relative Lorenz Dominance", "Not Relative Lorenz Dominance")
relative_lorenz_dominance_BC <- ifelse(gen_gini_B <= gen_gini_C, "Relative Lorenz Dominance", "Not Relative Lorenz Dominance")

absolute_lorenz_dominance_AB <- ifelse(all(income_A <= income_B), "Absolute Lorenz Dominance", "Not Absolute Lorenz Dominance")
absolute_lorenz_dominance_AC <- ifelse(all(income_A <= income_C), "Absolute Lorenz Dominance", "Not Absolute Lorenz Dominance")
absolute_lorenz_dominance_BC <- ifelse(all(income_B <= income_C), "Absolute Lorenz Dominance", "Not Absolute Lorenz Dominance")

# Summary of findings
summary_findings <- data.frame(Country_A = c(stochastic_dominance_AB, lorenz_dominance_AB, relative_lorenz_dominance_AB, absolute_lorenz_dominance_AB),
                               Country_B = c(stochastic_dominance_BC, lorenz_dominance_BC, relative_lorenz_dominance_BC, absolute_lorenz_dominance_BC),
                               Country_C = c(stochastic_dominance_AC, lorenz_dominance_AC, relative_lorenz_dominance_AC, absolute_lorenz_dominance_AC))

print(summary_findings)
