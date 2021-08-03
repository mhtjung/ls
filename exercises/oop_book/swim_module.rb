module Swimmable
  def swim
    "I'm swimming!"
  end

  def speak
    "Speaking from the module!"
  end

end

#superclass
class Animal;
  def speak
    "Speaking from the superclass!"
  end
end

#subclass of Animal
class Fish < Animal
  include Swimmable
end

#subclass of animal
class Mammal < Animal
end

#subclass of mammal < animal
class Cat < Mammal
end

#subclass of mammal < animal
class Dog < Mammal
  include Swimmable
  def speak
    super + "Speaking from the subclass!"
  end
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

puts Dog.ancestors