FactoryGirl.define do 
  factory :post do
    name "First"
    title "Initial"
    content "Basic"
  end
  
  factory :post_with_author, :parent => :post do
    association :author
  end
end