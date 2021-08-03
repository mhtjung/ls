class Pet
  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{@species} named #{@name}"
  end
end

class Owner
  attr_accessor :pets, :name
  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.size
  end

  def add_pet(pet)
    @pets << pet
  end
end

class Shelter
  def initialize
    @unadopted = []
    @adoptions = []
    @owners = []
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners << owner
    @unadopted.reject{|x| x == pet}
  end

  def print_adoptions
    @owners.uniq.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each {|pet| puts pet}
      puts ' '
    end
  end 

  def shelter(pet)
    @unadopted << pet
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog' , 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffly')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."