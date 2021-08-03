HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map{|x|x.to_i}
  (hours * 60 + minutes) % 1440
end

def before_midnight(time_str)
  minutes = 1440 - after_midnight(time_str)
  minutes = 0 if minutes == 1440
  minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0