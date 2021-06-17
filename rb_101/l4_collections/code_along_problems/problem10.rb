munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, attributes|
  case attributes['age']
  when 0..17
    attributes.merge!({"age_group" => "kid"})
  when 18..65
    attributes.merge!({"age_group" => "adult"})
  else 
    attributes.merge!({"age_group" => "senior"})
  end
end

puts munsters