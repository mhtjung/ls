=begin
The following code prompts the user to set their own password if they haven't done so already, and then prompts
them to login with that password. HOwever, the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected? Verify that you are able to login with
your new password.
=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password) 

=begin
The problem with the code was on lines 22 and 25. Because of variable scope, the code on line 
22 doesn't actually change the global variable 'password'. Instead, the function set_password
simply saves password and new_password as local variables.

This can be fixed changing line 30 to read
  password = set_password
This causes the global variable password to be used in the if clause and be set to the return value of set_password (which is the new password)

Finally, verify_password() didn't have access to the global variable 'password'. Instead, it tried to compare input to an unassigned local variable
'password'. By passing the variable in as a parameter and modifying the function accordingly, we can achieve the desired effect.

=end