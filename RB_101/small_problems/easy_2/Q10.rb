array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
p array1[5]
p array1[5].object_id
array2 = []
#array2 = Marshal.load(Marshal.dump(array1))
array1.each { |value| array2 << value }
array1.each_with_index { |val,idx| array1[idx] = val.upcase if val.start_with?('C', 'S') }
p array1[5]
p array1[5].object_id
#puts array2