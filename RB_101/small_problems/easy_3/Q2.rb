=begin
PEDAC PROCESS
P - Understanding the problem
  - The program will get posritive integers  from the users
  - Then print the result of the following operation(+, -, *, **, quotient
  remainder,)
  Questions:
  - How do we handle 0? 
  - Implicit - The first number is always the dividend, minus second from first
  - Result will be an integer no matter what
  -Explicit - Must be positive integer, negatives and 0s not allowed
  - Do not validate the inputs

E - Examples:
  ==> Enter the first number:
  23
  ==> Enter the second number:
  17
  ==> 23 + 17 = 40
  ==> 23 - 17 = 6
  ==> 23 * 17 = 391
  ==> 23 / 17 = 1
  ==> 23 % 17 = 6
  ==> 23 ** 17 = 141050039560662968926103

D - Data structures 
  - None

A - Algorithm
    - Ask user for the first number
    - Ask the user for the second number
    - Create varioud helper methods for performing the above operations

C - Code with intent - Consider the language limitations here
=end

def sum(first_num, second_num)
  result = first_num + second_num
  prompt("#{first_num} + #{second_num} = #{result}")
end

def subtract(first_num, second_num)
  result = first_num -  second_num
  prompt("#{first_num} - #{second_num} = #{result}")
end

def multiply(first_num, second_num)
  result = first_num * second_num
  prompt("#{first_num} * #{second_num} = #{result}")
end

def quotient(first_num, second_num)
  if second_num == 0
    prompt("Sorry, it's ILLEGAL to divide by 0")
    return
  end
  result = first_num / second_num
  prompt("#{first_num} / #{second_num} = #{result}")
end

def remainder(first_num, second_num)
  if second_num == 0
    prompt("Sorry it's ILLEGAL to divide by 0")
    return
  end 
  result = first_num % second_num
  prompt("#{first_num} % #{second_num} = #{result}")
end

def power(first_num, second_num)
  result = first_num ** second_num
  prompt("#{first_num} ** #{second_num} = #{result}")
end

def prompt(message)
  puts "==> #{message}"
end

def calculate()
  prompt("Enter the first number:")
  num1 = gets.chomp.to_f
  prompt("Enter the second number:")
  num2 = gets.chomp.to_f

  sum(num1, num2)
  subtract(num1, num2)
  multiply(num1, num2)
  quotient(num1, num2)
  remainder(num1, num2)
  power(num1, num2)
end

calculate()
