def greeting()
  puts 'What is your name?'
  name = gets.chomp
  if name[-1] == '!'
    puts "HELLO #{name.upcase[0..-2]}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

greeting

def chomp_greeting()
  puts 'What is your name?'
  name = gets.chomp
  if name[-1] == '!'
    name = name.chomp('!')
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

chomp_greeting

def chop_greeting()
  puts 'What is your name?'
  name = gets.chomp
  if name[-1] == '!'
    name = name.chop
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

chop_greeting