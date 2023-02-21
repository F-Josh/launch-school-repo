=begin
Write a mortgage calculator program using the below formular:
m = p * (j / (1 - (1 + j)**(-n)))


Inputs - Loan amount, Annual percentage rate(APR) and loan duration
Outputs:
monthly interest rate
loan duration in months
monthly payments

Pseudocode:
- Get the loan amount from the user using gets and validate it.
- Get the Annual percentage rate from the user and validate it.
- Get the loan duration from the user in months and validate it

- Calculate the monthly interest rate by first gettting the annual percentage
  rate and dividing by 12.
- Get the monthly payment amount using the above formula

=end

# The prompt method that adds style to our display
def prompt(msg)
  puts "=> #{msg}"
end

# A method that validates interger numbers
def valid_int?(number)
  number.to_i.to_s == number && number.to_i >= 0 && !number.empty?
end

# A method that validates floating numbers
def valid_float?(number)
  (number.to_f.to_s == number && number.to_f >= 0.0 && !number.empty?)
end

# A method that gets the loan amount from the user
def get_loan_amount
  loan_amount = nil
  loop do
    prompt("Please enter your loan amount:")
    loan_amount = gets.chomp
    break if valid_float?(loan_amount) || valid_int?(loan_amount)
    prompt("You did not enter a valid amount, please enter a valid amount.")
  end
  loan_amount.to_f
end

# A method that gets the annual percentage rate from the user
def get_annual_percentage_rate
  rate = nil
  loop do
    prompt("Please enter your Annual Percentage Rate(APR) in percents")
    rate = gets.chomp
    break if valid_float?(rate) || valid_int?(rate)
    prompt("You did not enter a valid APR, please enter a valid APR!")
  end
  rate.to_f
end


# A method that gets the loan duration from the user
def get_loan_duration
  duration = nil
  loop do
    prompt("Please enter your loan duration in months")
    duration = gets.chomp
    break if valid_int?(duration)
    prompt("You did not enter a valid duration, enter valid duration!")
  end
  duration.to_i
end

def get_monthly_rate
  monthly_interest_rate = get_annual_percentage_rate / 12
  monthly_interest_rate = monthly_interest_rate / 100
end

def calculate_monthly_payment(l_amount, m_rate, m_duration)
  l_amount * (m_rate / (1 - (1 + m_rate)** -m_duration))
end

def total_payments(m_payment, m_duration)
  m_payment * m_duration
end

def total_interest_amount(t_amount, l_amount)
  t_amount - l_amount
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  loan_amount = get_loan_amount
  monthly_rate = get_monthly_rate
  duration_in_months = get_loan_duration

  monthly_payment = calculate_monthly_payment(loan_amount, monthly_rate,
                    duration_in_months)
  total_payment = total_payments(monthly_payment, duration_in_months)
  total_interest_payment = total_interest_amount(total_payment, loan_amount)

  prompt("Payment every month: $#{format('%.2f', monthly_payment)}")
  prompt("Total of 120 Payments: $#{format('%.2f', total_payment)}")
  prompt("Total Interest payment: $#{format('%.2f', total_interest_payment)}")

  prompt("Another calculator?")
  answer = gets.chomp
  
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")



