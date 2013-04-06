# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sprint do
    daily_scrum "MyString"
    end_date "2013-04-06"
    start_date "2013-04-06"
    goal "MyText"
    name "MyString"
    project nil
  end
end
