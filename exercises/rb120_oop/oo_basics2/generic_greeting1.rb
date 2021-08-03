class Cat
  attr_reader :name, :color
  @@number_of_cats = 0

  def initialize(name, color)
    @name = name
    @color = color
    @@number_of_cats += 1
  end

  def self.generic_greeting
    puts "Hello! I'm a #{name} class object"
  end
  
  def self.total
    puts "There are #{@@number_of_cats} cats"
  end

  def personal_greeting
    puts "Hello! I'm #{name} and I'm a #{color} #{self.class.name.downcase}"
  end

  def to_s
    "I'm #{name}!"
  end
end

Cat.generic_greeting
kitty = Cat.new('Sophie', 'Calico')
kitty.personal_greeting
puts kitty