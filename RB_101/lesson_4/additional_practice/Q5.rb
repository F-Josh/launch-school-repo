
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
target = 0
flintstones.each_with_index do |element, idx|
  if element.start_with?("Be")
    target = idx
    break
  end
end
p target

p flintstones.index { |name| name.start_with?("Be")}