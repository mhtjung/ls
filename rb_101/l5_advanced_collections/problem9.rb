# Given this data structure return a new array of the same structure but with the sub arrays being ordered in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |x|
  x.sort do |a,b|
    b <=> arr
  end
end
