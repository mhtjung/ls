=begin
Problem:
Given an array of strings made only from lowercase letters, return an array of all characters
that show up in all strings within the given the given array (including duplicates).

For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character
3 times in the final answer

Examples:
["bella","label","roller"] == ['e','l','l']
['cool', 'lock', 'cook'] == ['c', 'o']
['hello','goodbye','booya','random'] == ['o']
['aaaaabbbbaaa', 'ccdddddd','eeeefffeee','ggggrrrrr','yyyyyyzzzzz'] = []

Data Structures:
Input: Array of lowercase trings
Return: Array of every character that is shared between all strings
  If a character appears x times in EACH string, the returned array should have x occurences of said character

Algorithm:
Only need the first element of the input array to check against
Checker = array.shift.chars

Iterate through characters (with select)
  Iterate through the other words in array
  Check if all the words contain the character
    Block should return true
    Remove only one of those characters from the checker

=end

def common_chars(arr)
  checker = arr.shift.chars
  checker.select do |char|
    arr.all? {|word| word.sub!(char, "")}
  end
end

p common_chars(["bella","label","roller"]) == ['e','l','l']
p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
p common_chars(['hello','goodbye','booya','random']) == ['o']