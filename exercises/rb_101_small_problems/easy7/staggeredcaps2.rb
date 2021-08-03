ALPHABET = ('A'..'Z').to_a.concat(('a'..'z').to_a)


def staggered_case(string)
  result = []
  string.chars.each {|x| result << x.downcase}
  counter = 0
  result.each do |x|
    if ALPHABET.include?(x)
      if counter.even?
        x.upcase!
        counter += 1
      else
      counter += 1
      end
    end
  end
  result.join('')
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'