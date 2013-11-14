# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
  	email {Faker::Internet.email}
  	requested_date_time "12/12/2013"
  	message "I want to book this restaurant"
  end
end
