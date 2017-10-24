FactoryGirl.define do
  factory :feedback do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    text {"When we think of Rails models, we usually think of reflecting the problem domain for which we are providing a solution. Models can sometimes be full-blown objects with rich behaviour. Other times, they can be just simple data containers or data maps."}
  end
end