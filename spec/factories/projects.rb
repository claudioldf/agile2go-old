# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    company "MyString"
    description "MyText"
    name "MyString"
  end
end
