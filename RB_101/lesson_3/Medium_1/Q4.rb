
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

arr = ["come", "Accra"]
"helo"
max = 3

p rolling_buffer1(arr, max, "papa")
p rolling_buffer1(arr, max, "mama")
p rolling_buffer1(arr, max, "Daddy")


def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if max_buffer_size > max_buffer_size
  buffer
end

arr2 = ['James', 'Chilwell']
p rolling_buffer2(arr2, 5, "Jesus")

p rolling_buffer2(arr2, 5, "mamJ")
p rolling_buffer2(arr2, 5, "jaja")
p rolling_buffer2(arr2, 5, "hello")






