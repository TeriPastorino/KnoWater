FactoryGirl.define do

  sequence(:uid) {|n| "uid-#{n}"}

  factory :user do
    name Faker::Name.name 
    provider "twitter"
    uid
  end

end
