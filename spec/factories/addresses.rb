# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "Maduranagar"
    city "Hyderabad"
    zipcode 540003
    country "India"
    user
  end
end
