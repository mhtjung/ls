# Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.
# You may assume the given string consists of lowercase English letters only.

# Example 1:
# Input: 'abab'
# Output: True
# Explanation: It's the substring "ab" twice

# Example 2:
# Input: 'aba'
# Output: False
# Explanation It cannot be created by a substring

# argument - string
# return true or false
  # rules - the entire string is a repeating substring

=begin
1. Create an array of substring, up to half the length of the original string and that are factors of the original string's size

2. For each of those substrings, multiply by string.size/substring.size

=end
require 'pry'

def sub_string(string)
  substrings = []
  1.upto(string.size / 2) do |length|
    if (string.size % length == 0)
      substrings << string[0,length]
    end
  end

  substrings.each do |substring|
    multiplier = string.size / substring.size
    return true if substring * multiplier == string
  end

  false
end
  
puts sub_string('hahaha')



