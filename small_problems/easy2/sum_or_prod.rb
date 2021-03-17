=begin
get integer
confirm that integer is > 0
  if not, start over

ask if they want sum or product of all numbers between 1 and integer
return sum or product


def sumoprod
  puts 'Please enter an integer greater than 0:'
  num = gets.chomp.to_i
  puts "Enter 's' compute the sum, 'p' to compute the product."
  operation = gets.chomp
  if operation.downcase == 's'
    return (1..num).to_a.reduce(:+)
  elsif operation.downcase == 'p'
    return (1..num).to_a.reduce(:*)
  end
end

puts sumoprod
=end

def sumoprod2
  loop do
    puts 'Please enter an integer greater than 0:'
    num = gets.chomp.to_i
    if num>0
      puts "Enter 's' compute the sum, 'p' to compute the product."
      operation = gets.chomp
      loop do
      if operation.downcase == 's'
        return (1..num).to_a.reduce(:+)
      elsif operation.downcase == 'p'
        return (1..num).to_a.reduce(:*)
      end
    else
      puts 'Invalid input - please try again'
    end
  end
end
puts sumoprod2