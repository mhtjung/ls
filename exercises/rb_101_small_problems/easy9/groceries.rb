# Write a method that takes a grocery list (array) of fruits with quantities and converst into an array of the correct number of each fruit.

arr = [["apples", 3], ["orange", 1], ["bananas", 2]]

def buy_fruit(arr)
  result = []
  arr.each do |inner|
    inner[1].times { result << inner [0]}
  end
  result
end

p buy_fruit(arr)