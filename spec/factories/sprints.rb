FactoryGirl.define do
  factory :sprint do
    daily_scrum "10:00"
    end_date "2013-04-06".to_date
    start_date "2013-05-06".to_date
    goal "Make it awsome"
    name "Sprint Test"
    project
  end
end
