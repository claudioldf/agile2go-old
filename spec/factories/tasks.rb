# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    storie "MyText"
    priority 1
    hours "MyString"
    status "MyString"
    sprint nil
  end
end
