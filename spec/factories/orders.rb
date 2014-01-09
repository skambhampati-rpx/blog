
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    orderd_date "2014-01-06"
    quanity 1
    price "9.99"
    user_id 1
    item_name "Soaps"
    discount "2.00"
  end
end
