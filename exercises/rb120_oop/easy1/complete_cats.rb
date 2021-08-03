class Pet
  attr_reader :name, :age, :fur

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, fur)
    super(name, age)
    @fur = fur
  end

  def to_s
    "My #{self.class.to_s.downcase} #{self.name} is #{self.age} years old and has #{self.fur} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch