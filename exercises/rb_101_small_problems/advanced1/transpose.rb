# Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column
require 'pry'

def transpose(matrix)
  new_matrix = []
  matrix[0].size.times do |x|
    new_row = []
    matrix.each { |arr| new_row << arr[x] }
    new_matrix << new_row.reverse
  end
  newj_matrix
end

#p transpose([[1, 2, 3, 4]])# == [[1], [2], [3], [4]]
#p transpose([[1], [2], [3], [4]])# == [[1, 2, 3, 4]]

# Determine coordinates for row and column
# Reverse them for every item in the Arr of Arrs
# Array of Arrays index position determines Row/ TRANSPOSED Column
# Inner Array index position determines Column/ TRANSPOSED Row

=begin
1. Initialize new_matrix = []
2. Iterate over each Arr in Arr of Arrs, noting it's index position
3. Iterate over each item in Array, noting it's index position
4. Add items to new_matrix using Array#map

=end

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]


def transpose2(matrix)
  result = []
  num_of_rows = matrix.size
  num_of_cols = matrix.first.size

  (0...num_of_cols).each do |col_idx|
    new_row = (0...num_of_rows).map { |row_idx| matrix[row_idx][col_idx]}
    result << new_row
  end
  result
end


  