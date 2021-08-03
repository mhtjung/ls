class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end
  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end

end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end

end
subie = Car.new(2007, 'STI')
ford = Truck.new(2008, 'Tacoma', 2000)
suzuki = Motorcycle.new(2000, 'GSXR')
vehicles = [subie, ford, suzuki]
vehicles.each {|vehicle| puts vehicle.wheels}
vehicles.each {|vehicle| puts vehicle.model}