require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect
LANGUAGE = 'en'

# ask user for two numbers
# ask user for an operation to perform
# perform the operation on the two numbers
# output  the result

# Refactoring our calculator program

# A method for initializing MESSAGE
def messages(message, lang='en')
  MESSAGES[lang][message]
end 

# Define a method that will output a unique prompt when asking user for input
def prompt(message)
  Kernel.puts("=> #{message}")
end

# Define a method that validates the inputs to make sure it's an integer
def valid_number?(num)
  # num.to_i() != 0 # Note that this has an exception for "0"
  num.to_i.to_s == num || num.to_f.to_s == num
  # Integer(num) rescue false
end

# define a method that confirms the operation that is performed
def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(messages('welcome', LANGUAGE))
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('invalid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  # Build a loop that takes the first number, break if valid? if no, loop again
  number1 = ''
  loop do
    prompt(messages('first_number', LANGUAGE))
    number1 = Kernel.gets().chomp() # chomp gets rid of new line cos of enter

    if valid_number?(number1)
      break
    else
      prompt(messages('invalid_number', LANGUAGE)) # go back to top
    end
  end

  number2 = ''
  loop do
    prompt(messages('second_number', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('invalid_number', LANGUAGE))
    end
  end

  # Note, I want to use hereDoc below to allow me write multi lines of string
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  
  # validate the operator input
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  # Add a prompt showing what is being done to show a confirmation
  prompt("#{operation_to_message(operator)} the two numbers...")

  # Note - all inputs are strings
  # Refactor the if/else to a case statement
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}")

  prompt(messages('repeat', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('end', LANGUAGE))
