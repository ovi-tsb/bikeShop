FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email 
    password "123456"
    first_name "Toto"
    last_name "Titi"
    admin false
  

      factory :admin do
        first_name "Admin"
        last_name "User"
        admin true
    end    
  end
end