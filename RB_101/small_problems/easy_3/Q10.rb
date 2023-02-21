

def palindromic_number?(num)
  #return "Wrong argument" if num.class != Integer
  # convert the number to digits which gives you the number in reverse
  #p num.to_s.reverse
  num.to_s == num.to_s.reverse
  # num_digits.join.to_i == num
end

p palindromic_number?('0345430') == true # why false?
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true