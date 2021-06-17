# Write a method that returns the number of Friday the 13ths in the year given by an argument.
# You may assume that the year is greater than 1752 (when the UK adopted the modern Gregorian
# Calendar) and that it will remain in use for the foreseeable future.

def friday_13th(year)
  fridays = 0
  (1..12).each do |month|
    fridays += 1 if Time.new(year, month, 13).friday?
  end
  fridays
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
puts friday_13th(2002)

def friday_13th(year)
  months = (1..12).to_a.map {|month| Time.new(year, month, 13).friday?}
  fridays = months.count {|x| x == true}
  puts fridays
end

friday_13th(2002)