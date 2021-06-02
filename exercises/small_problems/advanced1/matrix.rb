# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the
# transpose of the original matrix. Note that there is an Array#transpose method that
# this -- you may not use it for this exercise. You are also not allowed to use the 
# Matrix class from the standard library. Your task is to do this yourself.
# Take care not to modify the original matrix: you must produce a new matrix and leave
# the original matrix unchanged.

require 'pry'


GOAL = [
  [7, 4, 1],
  [8, 5, 2],
  [9, 6, 3]
]

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

def transpose(matrix)
  new_matrix = []
  3.times do |x|
    new_row = []
    matrix.each { |arr| new_row << arr[x] }
    new_matrix << new_row.reverse
  end
  new_matrix
end

def transpose!(matrix)
  2.downto(1) { |x| matrix[x] << matrix[0].pop}
  1.upto(2)   { |x| matrix[0].unshift(matrix[x].shift)}
  matrix[1].unshift(matrix[2].shift)
  matrix[2].insert(1, matrix[1].slice!(2))
  matrix
end

def transpose2(matrix)
  result = []
  num_of_rows = matrix.size
  num_of_cols = matrix.first.size

  (0...num_of_cols).times do |col_idx|
    new_row = (0...num_of_rows).map { |row_idx| matrix[row_idx][col_idx] }
    result << new_row
  end
end
