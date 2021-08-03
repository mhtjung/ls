class Person  
  attr_reader :name

  def name=(name)
    @name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLIZABETH'
puts person1.name