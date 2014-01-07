# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    city "MyString"
    zipcode 1
    country "MyString"
    user_id 1
  end
end
