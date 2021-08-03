

def count_occurrences(vehicles)
  results = {}
  vehicles.uniq.each do |x|
    results[x] = vehicles.count(x)
  end
  return results
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

puts count_occurrences(vehicles)