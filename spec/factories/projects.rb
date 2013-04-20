# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    company "Company Test"
    description "Any Test Description"
    name "Project Test"
  end
end
