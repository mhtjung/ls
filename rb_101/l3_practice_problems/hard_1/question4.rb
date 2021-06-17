def dot_separated_ip_address(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    x = dot_separated_words.pop
    return false unless is_an_ip_number?(x)
  end

  true
end