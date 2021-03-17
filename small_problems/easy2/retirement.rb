#lmao 

def retire()
  p 'What is your age?'
  age = gets.chomp.to_i
  p 'At what age would you like to retire?'
  ret_age = gets.chomp.to_i
  diff = ret_age - age
  year = Time.now.year
  puts "It's #{year}. You will retire in #{year+diff}"
  puts "You only have #{diff} years of work to go!"
end

retire