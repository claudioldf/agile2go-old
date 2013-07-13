FactoryGirl.define do
  factory :user do  	
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'    
    slug 'test-user'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
