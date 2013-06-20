# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :project, aliases: [:sprints, :users] do
    company 'Company Test'
    description 'Any Test Description'
    name 'Project Test'
  end

end
