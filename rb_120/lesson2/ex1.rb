class Person
  attr_accessor :first_name, :last_name

  def initialize(string)
    parse_name(string)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(new_name)
    parse_name(new_name)
  end

  def to_s
    self.name
  end

  private

  def parse_name(name)
    names = name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"