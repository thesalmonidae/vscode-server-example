import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

x = np.linspace(0, 2 * np.pi, 100)
y = np.sin(x)

df = pd.DataFrame({'x': x, 'y': y})

plt.figure(figsize=(10, 6))
plt.plot(df['x'], df['y'], label='sin(x)')
plt.xlabel('x')
plt.ylabel('sin(x)')
plt.title('Plot of sin(x)')
plt.legend()

plt.savefig('sin_plot.png')