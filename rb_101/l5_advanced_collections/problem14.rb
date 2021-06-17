# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = []

hsh.each do |_, v|
  new_arr << v[:colors].map{|x| x.capitalize} if v[:type] == 'fruit'
  new_arr << v[:size].upcase if v[:type] == 'fruit'
end

p new_arr