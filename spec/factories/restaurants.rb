require "faker"

FactoryGirl.define do
  factory :restaurant do |f|
    f.name { Faker::Name.name}
    f.description "The best Vietnamese restaurant in Chicago area"
    f.full_address {Faker::Address.street_address}
    f.phone_number {Faker::Number.number(10)}
  end
end
