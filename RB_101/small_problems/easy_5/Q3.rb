
def normalize(minutes)
  minutes % 1440
end

def convert_str_to_int(minutes_in_str)
  minutes_in_str.split(':').map(&:to_i)
end

def after_midnight(minutes)
  arr_of_time = convert_str_to_int(minutes)
  hrs = arr_of_time[0]
  mins = arr_of_time[1]
  curr = hrs * 60 + mins
  normalize(curr)
  
end

def before_midnight(minutes)
  arr_of_time = convert_str_to_int(minutes)
  hrs = arr_of_time[0]
  mins = arr_of_time[1]
  curr = hrs * 60  + mins
  ans = 1440 - curr # after_midnight
  normalize(ans)
  
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

