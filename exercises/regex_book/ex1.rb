# Write a method that returns true if its arguments looks like a URL, false if it does not.

def url?(text)
  !!text.match(/\A*https?:\/\/\S+\z/)
end

p url?('http://launchschool.com')   # -> true
puts url?('https://example.com')       # -> true
puts url?('https://example.com hello') # -> false
puts url?('   https://example.com')    # -> false