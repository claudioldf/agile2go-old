# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'adm123'
    password_confirmation 'adm123'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
