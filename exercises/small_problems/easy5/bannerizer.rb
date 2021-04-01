# bannerizier.rb

def border(string)
  puts "+#{'-' * (string.size+2)}+"
end

def padding(string)
  puts "|#{' ' * (string.size+2)}|"
end

def print_in_box(string)
  border(string)
  padding(string)
  puts "| #{string} |"
  padding(string)
  border(string)
end

print_in_box('This is a test')
