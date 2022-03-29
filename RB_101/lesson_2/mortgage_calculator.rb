# This program is a mortgage /payment calculator
# Pseudocode
# Welcome the user to the program
# SET the loan_amount which you will be give by the user and validate it
# SET the annual_percentage_rate which will be given by the user and validate
# SET the loan_duration which will be given by the the user and validate
# SET monthly_interest_rate - Calculate with above information
# SET loan_duration_in_months - calculate from the above information

# SET monthly_payment - formular in ruby =>  m = p * (j / (1-(1 + j)**(-n))))
# m = monthly_payment, p = loan_amount, j = monthly_interest_rate
# n = loan_duration_in_months

# FORMAL PSEUDOCODE
# Get the name of the user and welcome them to the program, validate
# GET the loan_amount from user using gets.chomp and validate it to float & int
# If not, display an error message and ask the user to re enter, break if true
# Get the annual percentage rate, and validate it, make sure you recal %

# A method that makes outputs unique
def prompt(message)
  puts("=> #{message}")
end

# A method to validate the loan amount
def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number # doesn't handle 1.
end

# start the program by welcoming the user to the program
prompt("Welcome to the mortgage calculator program, please enter your name:")

# Get the user name, make sure user enters a valid name, else
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Invalid name, please enter a valid name:")
  else
    break
  end
end

# Welcome the user by name
prompt("Hi #{name}!")
loop do 
  # Get loan amount from user and validate
  loan_amount = ''
  loop do
    prompt("Please enter the loan amount")
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt("Invalid loan amount, please enter a valid amount:")
    end
  end

  # Get the annual percentage rate from user and validate
  annual_percentage_rate = ''
  loop do
    prompt("Please enter your annual percentage rate(APR):")
    annual_percentage_rate = gets.chomp
    if valid_number?(annual_percentage_rate)
      break
    else
      prompt("Invalid percentage rate, please enter a valid % rate")
    end
  end

  # Get the loan deuration from the user and validate
  loan_duration = ''
  loop do
    prompt("Please enter your loan duration in MONTHS")
    loan_duration = gets.chomp
    if valid_number?(loan_duration)
      break
    else
      prompt("Invalid loan duration, please enter a valid number")
    end
  end

  # calculate loan_amount
  def get_loan_amount(amount)
    amount.to_f
  end

  # calculate monthly interest rate
  def get_monthly_interest_rate(annual_rate)
    monthly_rate = (annual_rate.to_f / 12.0)
    monthly_rate / 100
  end

  # calculate loan duration in months
  def get_loan_duration_in_months(duration)
    duration.to_i
  end

  # Calculate the monthly payment
  def get_monthly_payment(amount, monthly_rate, monthly_duration)
    month_payment = amount * (monthly_rate /
    (1 - (1 + monthly_rate)**(-monthly_duration)))
    month_payment
  end

   final = get_monthly_payment(get_loan_amount(loan_amount),
                            get_monthly_interest_rate(annual_percentage_rate),
                            get_loan_duration_in_months(loan_duration))
  
  prompt("Your monthly payment is: $#{format('%.2f', final)}")
  
  prompt("Another calculation?")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')

end

prompt("Thank you for using the Mortgage Calculator")
prompt("Good bye!")