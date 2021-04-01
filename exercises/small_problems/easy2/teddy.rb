def teddy()
  puts "Teddy is #{Random.rand(20..200)} years old!"
end

# I used Random#rand after reviewing the documentaion of Kernel#rand
# the former seemed more robust, though they are functionally equivalent
# when called with a range as the parameter

teddy

def teddy2()
  puts 'Roight, wots yore name then?'
  name = gets.chomp
  name = 'Teddy' if name==''
  puts "#{name} is #{Random.rand(20..200)} years old!"
end

teddy2