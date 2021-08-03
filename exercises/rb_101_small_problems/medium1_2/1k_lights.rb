=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off.
You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle
switches 2,4,6 and so on (lol zizek). On the third pass, you go back again to the beginning and toggle switches 3,6,9 and sho on.

You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.
=end

def lights(num_of_lights)
  lights = initialize_lights(num_of_lights)
  1.upto(num_of_lights).each do |interval|
    toggle_lights(lights, interval)
  end
  result = lights.keep_if{ |key, value| value == true}.keys
end

def initialize_lights(num_of_lights)
  keys = (1..num_of_lights).to_a
  values = keys.map{|_| false}
  lights = keys.zip(values).to_h
end

def toggle_lights(lights, interval)
  lights.each do |key, value|
    lights[key] = !value if key % interval == 0
  end
end

puts lights(5)
puts lights(10)