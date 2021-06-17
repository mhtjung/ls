# Given the following data strucutre, and without using the Array#to_h method, write some code that will return a 
# hash where the key is the first item in each sub array and the value is the second item

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hsh = {}

arr.each do |inner|
  temp_hash = {}
  temp_hash[inner[0]] = inner[1]
  new_hsh.merge!(temp_hash)
end

puts new_hsh

puts new_hsh == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}