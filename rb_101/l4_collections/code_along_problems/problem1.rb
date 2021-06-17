# Turn this array into a hash where the names are the keys and the values are the positions in the array

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

f_hash = {}
flintstones.each_with_index do |x, index|
  f_hash[x] = index
end

puts f_hash