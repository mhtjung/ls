class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

alpha = Animal.new('AnimalClass')
p alpha.name
p Animal.name

class BadDog < Animal

  attr_reader :age
  
  def initialize(age, name)
    super(name)
    @age = age
  end
end

bear = BadDog.new(2, 'bear')
puts bear.name
puts bear.age