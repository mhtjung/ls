def middle_out(words)
  length = words.split.length
  if length == 1
    return "There's only one word silly"
  elsif length.even?
    words.split[(length/2)-1]
  else
    words.split[(length/2)]
  end
end


puts middle_out('Return THIS word now')