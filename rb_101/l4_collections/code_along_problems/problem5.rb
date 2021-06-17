flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |x, index|
  if x[0..1] == 'Be'
    puts index
  else
    next
  end
end

