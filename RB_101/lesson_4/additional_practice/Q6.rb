
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |element|
  element = element[0, 3]
end
p flintstones