statement = "The Flintstones Rock"

flint_hash = Hash.new(0)

statement_array = statement.chars

statement_array.each {|char| flint_hash[char] += 1 if char != " "}

p flint_hash