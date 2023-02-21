
=begin
Iterate over the array using each and assing a block arg
Iterate over the block variable which is a hash with a key and value block args
Call the sort_by method on the  values
=end 
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

ans = books.sort_by do |item|
  item[:published].to_i
end
p ans

    
