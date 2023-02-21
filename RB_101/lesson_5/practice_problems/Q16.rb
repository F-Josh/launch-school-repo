=begin
- UUID accomplishes it tastk through randomization
- Each UUID consist of 32 hexadecimal characters
- Broken into 5 sections 8-4-4-4-12
- Represented as a string
- Write a method that returns one UUID

- Algorithm
- Get an an array of characters with characters from 0-9, and a-f
- Initialize an empty string and call it UID
- Initialize an array called sections and fill it up with the sections
- Iterate over section array
- For each element in section, generate random characters up to the value
- Attach the generated characters to UUID and add -
- return UUID
=end
def getUUID()
  hex_characters = ('a'..'f').to_a + ('0'..'9').to_a
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  num = 0
  sections.each do |element|
    1.upto(element) do |_|
      uuid += hex_characters.sample
    end
    uuid += "-" if num < sections.size - 1
    num += 1
    
  end
  uuid
end
p getUUID()