
def format_date(string)
  puts string.sub(/\A(\d\d\d\d)([-\/])(\d\d)\2(\d\d)\z/, '\4.\3.\1')
end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2017/05/03') # -> '03.05.2017'
format_date('2015/01-31') # -> '2015/01-31' (no change)