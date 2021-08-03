=begin
We wrote a method for moving a given number of elements from one array to another.
We decide to test it on our todo list, but invoking move() on line 11 results in a SystemStackError.

What does this error mean and why does it happen?
=end

def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin
Answer: A SystemStackError is the result of a program that has created a stack overflow, meaning the program has exceeded the available address space
in memory assigned to the program.

This is the result of the code on line 10, which recursively calls move(). This can be fixed by 
=end