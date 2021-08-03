=begin
A Rational Number is any number that can be represented as the result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc.
  The number to the left is called the numerator, and the number to the right is called denominator.

  A Unit Fraction is a rational number where the numerator is 1.
  An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as: 1/2 + 1/3 + 1/13 + 1/15
  Every positive rational number can be written as an Egyptian fraction. For example: 2 = 1/1 + 1/2 + 1/3 + 1/6

Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an
Egyptian Fraction representation of the number, and another that takes an Array of nubmers in the same format, and calculates the resulting
Rational number. You will need to use the R ational class provided by Ruby.
=end
require 'pry'

def egyptian(rational)
  results = []
  denominator = 1
  until rational == 0
    #binding.pry
    if rational - Rational(1, denominator) >= 0
      rational -= Rational(1, denominator)
      results << denominator
    end
    denominator += 1
  end
  results
end


def unegyptian(array)
  result = []
  array.each do |denominator|
    result << Rational(1, denominator)
  end
  result.sum
end

puts egyptian(Rational(2, 1)) == [1, 2, 3, 6]
puts egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
puts egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

puts unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
puts unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
puts unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
puts unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
puts unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
puts unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
puts unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
puts unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)