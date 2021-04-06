# Amend this arrray so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|x| x[0..2]}

puts flintstones