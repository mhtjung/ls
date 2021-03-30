# We could simply remove the entire if/else clause and simply leave the boolean expression. Ruby should return the value of the last evaluated line in a method.
# It would look something like this

def color_valid(color)
  color == 'blue' || color == 'green'
end
