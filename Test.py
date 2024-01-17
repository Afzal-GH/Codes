import numpy as np

# Define the transition matrix P
P = np.array([[0, 3/8, 3/8, 0, 1/4],
              [0, 1/2, 0, 1/2, 0],
              [2/3, 0, 0, 0, 1/3],
              [0, 1/4, 1/4, 0, 1/2],
              [1/2, 1/2, 0, 0, 0]])

# Initial state probabilities
P0 = np.array([0, 0, 0, 0, 1])  # starting in state 5

# (a) P(X_2=1 | X_0=4)
P_X2_1_given_X0_4 = P[0, 4]  # P(X_2=1 | X_1=5) * P(X_1=5 | X_0=4)

# (b) P(X_{12}=1, X_{13} | X_{10}=4, X_7=3)
P_X13_given_X10_4_X7_3 = P[0, 2]  # P(X_{13} | X_{12}=1) * P(X_{12}=1 | X_{11}) * P(X_{11} | X_{10}=4) * P(X_{10}=4 | X_9)

# Display the results
print("(a) P(X_2=1 | X_0=4):", P_X2_1_given_X0_4)
print("(b) P(X_{12}=1, X_{13} | X_{10}=4, X_7=3):", P_X13_given_X10_4_X7_3)
