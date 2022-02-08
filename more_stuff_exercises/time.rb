daylight = [true, false].sample

def time_of_day(arg)
  puts arg == true ? "It's day time" : "It night time"
end 

time_of_day(daylight)


