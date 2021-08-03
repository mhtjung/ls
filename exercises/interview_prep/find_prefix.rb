=begin
Write a method to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an ampty string "".


Note:
All given inputs are in lowercase letters a-z


Problem:
Write a method that takes an array of strings and returns a string object that is the longest common prefix amongst the words in the array

Examples:
Example 1:
Input: ["flower","flow","flight"]
Output: "fl"

Example 2:
Input: ["dog", "racecar", "car"]
Output: ""

Data Structures:
Input: Array
Output: N/A
Return: String object (common prefix)

Algorithm:
Notes:
Only need to compare against the shortest item in the array



Initialize results string object

Sort items in array by length
Iterate over characters of first element of array
  Check if it matches the respective letters of the other words
  If it does, append it to the results string 
  If it does not, break out of the loop
  
Return the results string object
=end

def find_prefix(arr)
  sorted = arr.sort_by {|x| x.size}
  results = ''
  sorted.first.chars.each_with_index do |char, idx|
    if other_words?(arr, idx, char)
      results << char
    else
      break
    end
  end
  results
end

def other_words?(arr, idx, char)
  arr.all? do |word|
    word[idx] == char
  end
end

p find_prefix(["flower","flow","flight"])
p find_prefix(%w(dog racecar car))
p find_prefix(%w(interspecies interstellar interstate))
p find_prefix(%w(throne dungeon))
p find_prefix(%w(throne throne))