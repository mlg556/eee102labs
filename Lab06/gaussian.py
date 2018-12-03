import math
import matplotlib.pyplot as plt


def gauss(x, peak, center, width, tam=True):
    a = peak
    b = center
    c = width

    us = - (((x-b)**2) / (2*c*c))
    result = a * math.exp(us)

    if tam:
        return int(result)

    return result


PEAK = 300
CENTER = 320
WIDTH = 100
LIMIT = 640

x = []
y = []

for i in range(LIMIT):
    y.append(gauss(i, PEAK, CENTER, WIDTH))
    x.append(i)

plt.bar(x, y)

plt.show()

print(y)
