FactoryGirl.define do

  factory :project, aliases: [:iterations, :members] do
    company 'Company Test'
    description 'Any Test Description'
    name 'Project Test'
  end

  factory :member do
  	iterations
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'    
  end

  factory :iteration do
  	members
    daily_scrum "10:00"
    end_date "2013-04-06".to_date
    start_date "2013-05-06".to_date
    goal "Make it awsome"
    name "Iterarion"
    project_id 1
  end

end
