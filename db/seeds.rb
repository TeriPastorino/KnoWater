require 'faker'
user_attr = {"name"=>"teri l pastorino", "provider"=>"twitter", "uid"=>"460270386"}

user = User.find_or_create_by({"name"=>"teri l pastorino", "provider"=>"twitter", "uid"=>"460270386"})
  

1.times do 
  activity = Activity.create!(
    user: user,
    activity_type: "shower",
    per_use: 7
    )
end

puts "seed finished"
puts "#{Activity.count} activities created"