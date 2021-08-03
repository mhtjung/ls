# take an integer
# mod-divide integer by 1440 (ensures that time is integers is less than 24 (24 hours would result in 0 change to the time))
  # this also solves for negative integers, since any remainder from the the previous operation can be thought to be 'added' to 0:00 from the current day.
# divmod integer by sixty, resulting in hours and minutes
# format output

def time_of_day(integer)
  integer = integer % 1440 #ensures that the minutes are less than 24 hours and accounts for negative integers
  hrs, min = integer.divmod(60)
  format('%02d:%02d',hrs,min)
end


puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"