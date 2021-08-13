#fixed array
  # initialization takes a number and set's the object to an array of 'nil' objects equal in size to the input number
  # bracket selection

# class FixedArray < Array
#   def initialize(size)
#     size.times do
#       self << nil
#     end
#     @size = size
#   end

#   def [](idx)
#     check_index(idx)
#     super(idx)
#   end 

#   def []=(idx, obj)
#     check_index(idx)
#     super(idx, obj)
#   end

#   private

#   def check_index(idx)
#     raise IndexError if idx.abs >= @size
#   end
# end

class FixedArray
  def initialize(num = 0)
    @array = Array.new(num)
  end

  def [](idx)
    @array.fetch[idx]
  end

  def []=(idx, obj)
    self[idx]
    @array[idx] = obj
  end

  def to_a
    @array.clone
  end

  def to_s
    to_a.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end