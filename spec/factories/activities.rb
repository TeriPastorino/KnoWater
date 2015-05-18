FactoryGirl.define do
  factory :activity do
    activity_type "MyString"
    per_use 2
    ounces 128
    high_efficiency false
  end

end
