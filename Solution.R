# Load the lpSolve package
library(lpSolve)

# Define the coefficients of the objective function (annual rate of return)
objective_coeffs <- c(7, 9, 10, 11, 6)

# Define the right-hand side values for the constraints
rhs <- c(2200000, 0.3 * 2200000, 0, 0, 0)

# Define the constraint matrix (coefficients for each loan/investment)
constraint_matrix <- matrix(
   data = c(
      1, 1, 1, 1, 1,  # Total funds available for investment
      0, 0, 0, 0, 1,  # Limit on Risk-Free Securities
     -1, -1, -1, -1, 10,  # Limit on Signature Loans
     -1, 1, 1, 0, 0,  # Furniture Loans plus Other Secured Loans <= Automobile Loans
      0, 0, 1, 1, -1   # Other Secured Loans plus Signature Loans <= Funds in Risk-Free Securities
   ),
   ncol = 5, byrow = TRUE
)

# Define the direction of the constraints (less than or equal to)
direction <- rep("<=", 5)

# Use lpSolve to solve the linear programming problem
lp_solution <- lp("max", objective_coeffs, constraint_matrix, direction, rhs)

# Print the solution
cat("Loan/Investment Allocations:")
print(format(lp_solution$solution), scientific=F)

# Calculate the projected total annual return
total_annual_return <- sum(objective_coeffs * lp_solution$solution)
cat("Projected Total Annual Return $", total_annual_return)
