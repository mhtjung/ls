=begin
String#upcase! is a destructive method, so why does this code print 'HEY you' instead of 'HEY YOU' ?
  Modify the code so that it produces the expected output.
=end

def shout_out_to(name)
  puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'

=begin
The original function used a .each call to iterate over the items in name.chars
  This fails, however, because the string 'name' has not been changed.

You can fix this by simply using the String#upcase method on the input string and then prepending "HEY"
=end