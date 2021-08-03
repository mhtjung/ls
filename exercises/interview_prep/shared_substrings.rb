=begin
Given 2 strings, your job is to find out if there is a substring
that appears in both strings. You will return true if you find
a substring that appears in both strings, or false if you do not.

We only care about substring that are longer than one letter long.

Examples

Data Structure:
Input: Two string objects
Return: boolean true/false
Output: N/A


Algorithm:

Return false if one or both arguments are empty strings

Generate possible substrings for shorter string
  Remove substrings with a length of 1

Check if longer argument includes any of the substrings
Return true if one is found, otherwise false


Substring Helper:
Initialize holder object
Set a counter to 0
Loop as many times as the string's length
  iterate over characters in string
    For each iteration, slice from counter to index
    Append slice to holder object
  increment counter to 1
end loop
return holder object
  
=end

def substring_test(str1, str2)
  arr = [str1, str2].sort_by {|str| str.size}
  short, long = arr.first.downcase, arr.last.downcase
  substrings = generate_substrings(short)
  match = false
  substrings.each { |substring| match = true if long.include?(substring)}
  match
end

def generate_substrings(str)
  results = []
  start = 0
  str.size.times do |_|
    str.chars.each_with_index do |_, idx|
      slice =  str.slice(start..idx)
      results << slice if slice.empty? == false && slice.size > 1
    end
    start += 1
  end
  results.uniq
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrocious') == true

