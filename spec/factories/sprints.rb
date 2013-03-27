# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sprint do
    name "MyString"
    start_date "2013-03-26"
    end_date "2013-03-26"
    daily_scrum "MyString"
    goal "MyString"
    project nil
  end
end
