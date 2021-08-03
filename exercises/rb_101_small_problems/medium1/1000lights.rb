require 'pry'

def initialize_lights(n)
  lights = {}
  1.upto(n) {|number| lights[number] = 'off'}
  lights
end

def on_lights(lights)
  lights.select {|key,value| value == "on"}.keys
end

def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

def toggle_lights(n)
  lights = initialize_lights(n)
  1.upto(lights.size) do |num|
    toggle_every_nth_light(lights, num)
  end

  on_lights(lights)
end

p toggle_lights(1000)