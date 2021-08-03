require 'time'

class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  @@number_of_vehicles = 0
  def initialize(color, year, model)
    @color = color
    @year = year
    @model = model
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def to_s
    "#{@color} #{@year} #{@model}"
  end

  def current_speed
    puts "You're currently going #{@current_speed} mph"
  end
  def accelerate(num)
    puts "You've accelerated from #{@current_speed} to #{@current_speed + num}"
    @current_speed += num
  end

  def brake(num)
    puts "You've deccelerated from #{@current_speed} to #{@current_speed - num}"
    @current_speed -= num
  end

  def shut_off
    puts "The car is now shut off"
    @current_speed = 0
  end
  
  def spray_paint(new_color)
    self.color = new_color
    puts "Your #{self.model} is now #{self.color}"
  end

  def self.count
    "There are #{@@number_of_vehicles} Vehicle objects"
  end

  def self.gas_mileage(miles, gallons)
    "Your mileage is #{miles/gallons} mpg"
  end
  def age
    puts "This #{@model} is #{calculate_age} years old"
  end

  private

  def calculate_age
    Time.now.year - self.year
  end

end


module Tailgate
  @tailgate_open = false
  def open_tailgate
    if @tailgate_open
      puts "Tailgate is already open"
    else  
      @tailgate_closed = true
      puts "Tailgate is open"
    end
  end
  def close_tailgate
    if !@tailgate_open
      puts "Tailgate is already closed"
    else
      @tailgate_open = false
      puts "Tailgate is closed"
    end
  end
end

class MyTruck < Vehicle
  include Tailgate
  TRUCK_BED = true
  def to_s
    "My truck is a #{super()}"
  end
end

class MyCar < Vehicle
  TRUCK_BED = false  
  def to_s
    "My car is a #{super()}"
  end
end

subaru = MyCar.new('Red', 2001, 'STI')
# subaru.accelerate(50)
# subaru.brake(25)
# subaru.current_speed
# subaru.shut_off
# subaru.current_speed
p subaru.color
puts subaru
chevy = MyTruck.new('Blue', 2005, 'Silverado')
puts chevy

puts Vehicle.gas_mileage(100, 20)
subaru.age