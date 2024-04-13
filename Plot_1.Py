import numpy as np
import matplotlib.pyplot as plt

# Define range for x and y
x = np.linspace(-2, 2, 400)
y = np.linspace(-2, 2, 400)

# Create grid of x and y values
X, Y = np.meshgrid(x, y)

# Maps (a), (b), and (c)
maps = [
    ('a', X**2 + Y**2, 2*X*Y),
    ('b', X**2 - Y**2, 2*X*Y),
    ('c', np.exp(-Y) * np.cos(X), np.exp(-Y) * np.sin(X))
]

# Plot the curves
plt.figure(figsize=(15, 5))
for i, (map_label, u, v) in enumerate(maps, start=1):
    plt.subplot(1, 3, i)
    plt.contour(X, Y, u, levels=[0, 1], colors=['r', 'b'], linestyles=['solid', 'dashed'])
    plt.contour(X, Y, v, levels=[0, 1], colors=['g', 'm'], linestyles=['solid', 'dashed'])
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title(f'Map ({map_label})')
    plt.grid(True)
    plt.gca().set_aspect('equal', adjustable='box')
    plt.legend(['u(x, y) = 0', 'u(x, y) = 1', 'v(x, y) = 0', 'v(x, y) = 1'])

plt.tight_layout()
plt.show()
