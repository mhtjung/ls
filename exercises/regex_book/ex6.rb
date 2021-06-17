# Write a method that changes dates in the format '2016-06-17' to the format '17.06.2016'
# You must use a regex and should use methods described in this section.

def format_date(string)
    string.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end

puts format_date('2016-06-17') # -> '17.06.2016'
puts format_date('2016/06/17') # -> '2016/06/17' (no change)