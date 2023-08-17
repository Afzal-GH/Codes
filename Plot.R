# Load the library
library(ggplot2)

# Given inputs
interest_rate <- 0.0625
dividend_rate <- 0.06

# Option prices
strike_prices <- c(31.00, 34.00, 41.00)
call_prices <- c(2.71, 2.41, 0.36)
put_prices <- c(2.40, 5.01, 9.74)

# Calculate costs of synthetic strategies
synthetic_long_call_cost <- call_prices - (1 - exp(-dividend_rate)) * strike_prices
synthetic_short_put_cost <- put_prices - call_prices + (1 - exp(-dividend_rate)) * strike_prices

# Identify the option with minimum cost for arbitrage
min_cost_option <- which.min(pmin(synthetic_long_call_cost, synthetic_short_put_cost))

# Arbitrage portfolio strategy
arbitrage_strategy <- ifelse(synthetic_long_call_cost[min_cost_option] < synthetic_short_put_cost[min_cost_option],
                             "Synthetic Long Call", "Synthetic Short Put")
option_chosen <- strike_prices[min_cost_option]

# Plot Payoff and Profit Diagrams
payoff_long_call <- function(stock_price, option_strike) {
   pmax(stock_price - option_strike, 0)
}

payoff_short_put <- function(stock_price, option_strike) {
   pmax(option_strike - stock_price, 0)
}

stock_price_range <- seq(option_chosen - 10, option_chosen + 10, by = 0.1)
payoff_call <- payoff_long_call(stock_price_range, option_chosen)
payoff_put <- payoff_short_put(stock_price_range, option_chosen)

profit_call <- payoff_call - synthetic_long_call_cost[min_cost_option]
profit_put <- payoff_put - synthetic_short_put_cost[min_cost_option]

data <- data.frame(stock_price = stock_price_range, payoff_call = payoff_call, payoff_put = payoff_put,
                   profit_call = profit_call, profit_put = profit_put)

ggplot(data, aes(x = stock_price)) +
   geom_line(aes(y = payoff_call, color = "Payoff Long Call"), size = 1) +
   geom_line(aes(y = payoff_put, color = "Payoff Short Put"), size = 1) +
   geom_line(aes(y = profit_call, color = "Profit Long Call"), linetype = "dashed", size = 1) +
   geom_line(aes(y = profit_put, color = "Profit Short Put"), linetype = "dashed", size = 1) +
   geom_vline(xintercept = option_chosen, color = "red", linetype = "dashed") +
   geom_vline(xintercept = option_chosen + synthetic_long_call_cost[min_cost_option], color = "blue", linetype = "dashed") +
   geom_vline(xintercept = option_chosen + synthetic_short_put_cost[min_cost_option], color = "green", linetype = "dashed") +
   labs(title = "Payoff and Profit Diagrams of Arbitrage Portfolio", x = "Stock Price", y = "Payoff/Profit") +
   scale_color_manual(values = c("blue", "red", "green", "black"),
                      labels = c("Profit Long Call", "Profit Short Put", "Payoff Long Call", "Payoff Short Put")) +
   theme_minimal()
