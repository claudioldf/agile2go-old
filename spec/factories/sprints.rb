# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sprint do
    daily_scrum "10:00"
    end_date "2013-04-06"
    start_date "2013-05-06"
    goal "Make it awsome"
    name "Iterarion"
    project 1
  end
end
