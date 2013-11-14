require "faker"

FactoryGirl.define do
  factory :restaurant do
    name { Faker::Name.name}
    description "The best Vietnamese restaurant in Chicago area"
    full_address {Faker::Address.street_address}
    phone_number {Faker::Number.number(10)}
  end

  # factory :invalid_restaurant, class: Restaurant do
  # 	name { Faker::Name.name}
  # 	description "The best Vietnamese restaurant in Chicago area"
  # 	full_address {Faker::Address.street_address}
  # 	phone_number {Faker::Number.number(9)}
  # end
end

