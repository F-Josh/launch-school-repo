=begin
PEDAC
PEDA
  Inputs - 2 arguments - 2 arguments, amount and tip rate
  Outputs -  Return Display tip and total amount with bill with tip

  Problem domain-  An integer is a whole number and can be positive or negative
  Explicit /Implicit - Output should be a foating value
  -

  Questions- Can can tips be 0?

  Example:
    What is the bill? 200
    What is the tip percentage? 15

    The tip is $30.0
    The total is $230.0

  DS- 

  Algorithm:
    - Ask user for the bill
    - Ask user for the tip
    - validate your inputs to make sure they are integers or float
    - Do not accept 0s or negative for amounts
    - Deal with a case if user inputs 0 or nothing for tip
    - Calculate the tip_amount = rate/ 100 * amount and amount+= tip amount
    - Print tip amount and total amount

Code with intent 
=end

def total_amount()
  puts "What is the bill?"
  amount = gets.chomp.to_i
  total_amount() if amount.class != Integer && amount.class != Float
  puts "What is the the tip percentage?"
  tip_percent = gets.chomp.to_f
  total_amount() if tip_percent.class != Integer && tip_percent.class != Float && tip_percent == 0

  tip_amount = ((tip_percent/100) * amount)
  total = amount + tip_amount

  puts "The tip is $#{format("%.2f", tip_amount)}"
  puts "The total is $#{format("%.2f", total)}"
end
total_amount()

