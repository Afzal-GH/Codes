import numpy as np
from scipy.integrate import dblquad

def integrand(tau1, tau2, t, lambd):
    return np.exp(-2*lambd*np.abs(tau1 - tau2)) * np.sin(t - tau1) * np.sin(t - tau2) / ((t - tau1) * (t - tau2))

def average_power(t, lambd):
    integrand_args = (t, lambd)
    result, error = dblquad(integrand, -np.inf, np.inf, lambda tau2: -np.inf, lambda tau2: np.inf, args=integrand_args)
    return result / (np.pi**2)

# Example usage
t = 1.5  # Time value for which we want to calculate the average power
lambd = 0.5  # Value of lambda parameter

power = average_power(t, lambd)
print("Average power:", power)
