# Remove people with age 100 or greater

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
young = ages.select {|k,v| v < 100}

puts young