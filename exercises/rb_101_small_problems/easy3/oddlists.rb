#Write a method that returns an array that contains every other element of an array that's pased in as an argument
#keep_if? arr.index(x).even?

def oddities(arr)
  arr.keep_if{|x|arr.index(x).even?}
end

def odd_no_mutate(array)
  newarr = []
  array.each do |x|
    newarr.push(x) if array.index(x).even?
  end
  newarr
end

puts odd_no_mutate([2, 3, 4, 5, 6]) == [2, 4, 6]
puts odd_no_mutate([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts odd_no_mutate(['abc', 'def']) == ['abc']
puts odd_no_mutate([123]) == [123]
puts odd_no_mutate([]) == []

my_arr = %w(a b c d e)
puts odd_no_mutate my_arr
puts my_arr