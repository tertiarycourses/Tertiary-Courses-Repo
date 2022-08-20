# -*- coding: utf-8 -*-
"""Monte Carlo Simulation

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1OuJUG4mqaX2AoeuHn9CNr-4hLa5xM0JU
"""

import random

import matplotlib.pyplot as plt

def coin_flip():
  return random.randint(0,1) #Define a function that randomly gives us either 0 or 1 as the output.

coin_flip()

list1 = [] #Empty list to store the probability values.

def monte_carlo(n):
  results = 0
  for i in range(n):
    flip_result = coin_flip()
    results = results + flip_result
    prob_value = results/(i+1)
    list1.append(prob_value)
    plt.axhline(y= 0.5, color='red', linestyle='-')
    plt.xlabel('Iterations')
    plt.ylabel('Probability')
    plt.plot(list1)
  return results/n

answer = monte_carlo(1000)

print('Final value :',answer)