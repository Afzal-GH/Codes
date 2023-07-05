import math

def calculate_expectations():
    E_Z = 0.0
    E_Z_squared = 0.0
    E_Z_cubed = 0.0

    for n in range(1, 1000):  # You can adjust the range as needed
        zn = (-1) ** n * math.sqrt(n)
        probability = 6 / (n * math.pi) ** 2

        E_Z += zn * probability
        E_Z_squared += zn ** 2 * probability
        E_Z_cubed += zn ** 3 * probability

    return E_Z, E_Z_squared, E_Z_cubed

# Call the function to calculate the expectations
E_Z, E_Z_squared, E_Z_cubed = calculate_expectations()

# Print the results
print(f"E[Z]: {E_Z}")
print(f"E[Z^2]: {E_Z_squared}")
print(f"E[Z^3]: {E_Z_cubed}")
print(E_Z_squared - E_Z ** 2)
