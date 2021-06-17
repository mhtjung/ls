# When modifying an array while iterating, you can run into unexpected results. In the example provided, ruby is attempting to resume iteration after the first loop at a certain
# index position in the array. The shift method, however, alters the contents of the array, thereby changing the values at each respective index position. When the each method 
# goes through it's second iteration, the value at index position 1 is now the number 3, instead of the number.

# In the second code example, we see that the array is being shortened with each iteration, so instead of 4 iterations, we only get 2.
