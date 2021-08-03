class Transform
  attr_accessor :my_data

  def initialize(string)
    @my_data = string
  end
  
  def uppercase
    @my_data.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')