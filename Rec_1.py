def get_own_sandwich(N):
    # Base case: R(1) = 1
    if N == 1:
        return 1
    
    # Initialize the probabilities for R(1) to R(N) with R(1) = 1
    probabilities = [0] * N
    probabilities[0] = 1
    
    # Calculate the probabilities using the recurrence relation
    for i in range(1, N):
        probabilities[i] = sum(probabilities[j] for j in range(i)) / (i + 1)
    
    return probabilities[N - 1]

# Calculate R(1000)
R_1000 = get_own_sandwich(1000)
print("R(1000) =", R_1000)
