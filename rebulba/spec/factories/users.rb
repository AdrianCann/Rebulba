# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'I_love_Sam'
    email 'samfan@truelove.com'
    password '123456'
  end
end
