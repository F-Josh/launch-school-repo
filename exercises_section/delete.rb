arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
puts arr.delete_if { |item| item.start_with?('s', 'w')}