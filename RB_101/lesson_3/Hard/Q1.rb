if false
  greeting = "hello world"
end

greeting # => nil 
# Why does it return nil and not unddefined local variable exception? 
# In Ruby, when you initialize a variable within an if block
# is initialized in an if block, even if that block is not executed, the local
# variable is initialized to nil