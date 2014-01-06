# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :aliases => [:commenter, :author] do
    first_name "John"
    last_name "Doe"
    admin false
  end
  factory :admin, :class => User do
    first_name "Admin"
    last_name "User"
    admin true
  end
end
