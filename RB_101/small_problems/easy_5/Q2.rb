=begin
PEDAC PROCESS
P - Understanding the problem
  - The time of the day can be represented as the number of minutes 
     before or after midnight.
  - If the number of minutes == positive then time is after midnight
  - If the number == negative the time is before midnight
  - Write a method that takes the time using minuted-based format and returns
    the time of the day in 24 hour format(hh:mm)
  - Input - time(integer)
  - Output - Integer(time of the day in 24 hours format)

  Questions:
  - 0 is an integer so how do we treat it?

  -Explicit - Disregard daylight savings and standard time
  - Implicit - 0 -> 00.00

E - Examples:
  time_of_day(0) == "00:00"
  time_of_day(-3) == "23:57"
  time_of_day(35) == "00:35"
  time_of_day(-1437) == "00:03"
  time_of_day(3000) == "02:00"
  time_of_day(800) == "13:20"
  time_of_day(-4231) == "01:29"
  

D - Data structures 
  - N/A

A - Algorithm
    - 

C - Code with intent - Consider the language limitations here
=end

def time_of_day(minutes)
  # First is to get the hours and minutes and to do that you use divmod
  # to get the quotient == hours and the remainder == minutes
  # hours > 23, which means it is in days, use % to get the hours/per day
  # If minutes == negative and hours < 0, subtract the hrs.abs from 24

  minutes_per_hour = 60
  hrs, mins =  minutes.divmod(minutes_per_hour)
  hrs = hrs % 24 

  format("%.2d:%02d","#{hrs}", "#{mins}")
end
p time_of_day(-4231)


MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60
SECONDS_PER_MINUTE = 60

# Further Exploration Problem 1
def time_of_day(n)
  time = (n % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
  format("%0.2d:%0.2d", time[0], time[1])
end

# Further Exploration Problem 2
def time_of_day(n)
  time = n * SECONDS_PER_MINUTE
  Time.at(time).utc.strftime("%H:%M")
end

# Further Exploration Problem 3
def time_of_day(n)
  time = n * SECONDS_PER_MINUTE
  (Time.new(1970,1,4)+time).strftime("%A %H:%M")
end