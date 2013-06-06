# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    storie "As a... I want to... so I'll be able to..."
    priority 1
    hours "08:00"
    status "TODO"
    sprint nil
  end
end
