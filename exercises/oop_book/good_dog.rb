class GoodDog
  DOG_YEARS = 7
  
  attr_accessor :name, :height, :weight, :age
  @@number_of_dogs = 0

  def self.total_number_of_dogs
    @@number_of_dogs
  end

  def initialize(n, h, w, a)
    @name = n
    @height = h
    @weight = w
    @age = a * DOG_YEARS
    @@number_of_dogs += 1
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs', 3)
p GoodDog.total_number_of_dogs
dog1 = GoodDog.new('Jackie', '55 lbs', '28 inches', 4)
dog2 = GoodDog.new('Leia', '45 lbs', '24 inches', 5)
puts sparky
p sparky
puts "#{sparky}"