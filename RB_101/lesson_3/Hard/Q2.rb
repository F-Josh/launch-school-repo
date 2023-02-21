greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings #=> This code will output {:a=>"hi there"} because 
# informal_greeting still points to an object reference by greeting and using
# String#<< mutates the original object. To avoid this, clone the object to
# muatate or use the string concatenation informal_greeting += 'there'