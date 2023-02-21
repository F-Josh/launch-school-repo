
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

h = hsh.each_with_object([]) do |(_, value), new_array|
  if value[:type] == 'fruit'
    new_array << value[:colors].map(&:capitalize)
  else
    new_array << value[:size].upcase
  end
end
p h 
