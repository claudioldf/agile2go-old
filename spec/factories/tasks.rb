FactoryGirl.define do
  factory :task do
    storie "As a... I want to... so I'll be able to..."
    priority 1
    hours "08:00"
    status "todo"
    sprint
  end
end
