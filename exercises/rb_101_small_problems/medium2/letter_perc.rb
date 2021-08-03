def convert(percentages, length)
  percentages[:lowercase] = (percentages[:lowercase] / length.to_f * 100).round(2)
  percentages[:uppercase] = (percentages[:uppercase] / length.to_f * 100).round(2)
  percentages[:neither] = (percentages[:neither] / length.to_f * 100).round(2)
  percentages
end

def letter_percentages(text)
  upper = ('A'..'Z').to_a
  lower = ('a'..'z').to_a
  percentages = {}
  percentages[:lowercase] = text.chars.count { |char| lower.include?(char) }
  percentages[:uppercase] = text.chars.count { |char| upper.include?(char) }
  percentages[:neither]   = text.chars.count { |char| upper.none?(char) && lower.none?(char)}
  convert(percentages, text.size)
end


puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts letter_percentages('abcdefGHI')
