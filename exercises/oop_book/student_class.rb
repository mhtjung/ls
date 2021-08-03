class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_stud)
    @grade > other_stud.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 83)

puts "Well Done!" if joe.better_grade_than?(bob)