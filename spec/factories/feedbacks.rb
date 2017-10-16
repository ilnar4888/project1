FactoryGirl.define do
  factory :feedback do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    text { Faker::Lorem.paragraph(20) }    
  end
end
