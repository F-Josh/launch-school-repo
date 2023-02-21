def sum_even_number_row(row_number)
  return "Please enter a valid number" if row_number.class != Integer || row_number <= 0
  rows = []
  start_integer = 2
  row_hash = {}
  (1..row_number).each do |current_row_number|
    temp = []
    until temp.length == current_row_number
      temp << start_integer
      start_integer += 2
    end
    row_hash[current_row_number] = temp
    start_integer = temp[-1] + 2
  end
  arr = row_hash[row_number]
  arr.reduce {|total, num| total + num}
end

p sum_even_number_row(1)
p sum_even_number_row(2)
p sum_even_number_row(1)


def triangle(row_number)
  return "Please enter a valid number" if row_number.class != Integer || row_number <= 0
  rows = []
  start_integer = 1
  row_hash = {}
  (1..row_number).each do |current_row_number|
    temp = []
    until temp.length == current_row_number
      temp << start_integer
      start_integer += 2
    end
    row_hash[current_row_number] = temp
    start_integer = temp[-1] + 2
  end
  arr = row_hash[row_number]
  arr.reduce {|total, num| total + num}
end

p triangle(5)
p triangle(50)
p triangle(3)