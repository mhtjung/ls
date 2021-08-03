# Write a method that takes a floating point number that represents an angle between 0 and 360
# and return a string that represents that angle in degrees, minutes, and seconds. You should use a degree symbol
# to represent degree, a single quote to represent minutes, and a double quote to represent seconds.

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def within360(degrees)
  if degrees > 360
    degrees = degrees%360
  elsif degrees < 0
    until degrees > 0
      degrees += 360
    end
    degrees
  else
    degrees
  end
end

def dms(degrees)
  degrees = within360(degrees)
  total_seconds = degrees * SECONDS_PER_DEGREE
  degrees, remainder = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remainder.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end




puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")