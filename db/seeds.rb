require 'faker'



1.time do 
  activity = Activity.create!(
    activity_type: Shower
    per_use: 7
    )
end

puts "seed finished"
puts "#{Activity.count} activities created"