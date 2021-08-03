
def greeting(arr,hsh)
  name = arr.join(' ')
  title = hsh[:title]
  job = hsh[:occupation]
  "Hello, #{name}! Nice to have a #{title} #{job} around"
end

puts greeting(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })