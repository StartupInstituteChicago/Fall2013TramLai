# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :owner do
  	name {Faker::Name.name}
  	email {Faker::Internet.email}
  	password {Faker::Internet.password}
  end
end
