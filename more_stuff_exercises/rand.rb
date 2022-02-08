names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['Walking', 'running', 'cycling']

def name(name_array)
  name_array.sample
end

def activity(activity_array)
  activity_array.sample
end 

def sentence(name, activity)
"#{name} went #{activity} today!"
end 

puts sentence(name(names), activity(activities))