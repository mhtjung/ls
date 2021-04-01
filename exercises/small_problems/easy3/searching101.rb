#need to come back and figure out how to better validate input

#write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number amongst the first 5 numbers.

=begin
get 6 numbers from the user
lnum = numbers.pop
return 'some statement' if x lnum in numbers
else return 'some other statement'
=end

def get_nums
  list = []
  loop do
    puts "Please enter a number. Press 'q' to quit"
    num = gets.chomp
    if num.downcase == 'q'
      return list
    else
      list.push(num.to_i)
    end
  end
end

def searching
    nums = get_nums
    unless nums == []
      if nums.include?(x = nums.pop)
        puts "The number #{x} appears in #{nums}"
      else
        puts "The number #{x} does not appear in #{nums}"
      end
    else
      puts "Whoops - I didn't get that. Let's try again!"
    end
end

searching