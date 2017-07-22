FactoryGirl.define do

  sequence(:id) { |n| "#{n}" }

  factory :product do
    name "Generated bike"
    image_url "C16.jpg"
    price "200.99"
    colour "red"
    description "Nice bike"
  end
end