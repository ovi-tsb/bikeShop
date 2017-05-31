FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email 
    password "123456"
    first_name "Toto"
    last_name "Titi"
    admin false
  end

  factory :admin do
    admin true
  end
end