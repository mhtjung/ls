class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    grade = new_grade
  end

end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade # => "A"