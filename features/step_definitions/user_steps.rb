def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user)
end

def create_visitor
  @visitor ||= FactoryGirl.build(:user)
end

def find_user_by_email
  User.find_by_email(@visitor.email)
end

def find_user
  @user ||= find_user_by_email
end

def delete_user
  @user ||= find_user_by_email
  @user.destroy unless @user.nil?
end

def sign_up      
  visit '/auth/sign_up'
  fill_in "user_name", with: @visitor.name
  fill_in "user_email", with: @visitor.email
  fill_in "user_password", with: @visitor.password
  fill_in "user_password_confirmation", with: @visitor.password_confirmation
  click_button "Sign up"    
end

def sign_in
  visit '/auth/sign_in'
  fill_in "user_email", with: @visitor.email
  fill_in "user_password", with: @visitor.password
  click_button "Sign in"
end

## Given ##
Given /^I am not logged in$/ do
  visit '/auth/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as a user$/ do
  create_user
end

## When ##
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign up with valid user data$/ do  
  create_user
  sign_up
end

When /^I sign up with an invalid email$/ do  
  @visitor = FactoryGirl.build(:user, email: 'not_an_email')
  sign_up
end

When /^I sign up without a password$/ do
  @visitor = FactoryGirl.build(:user, password: '')
  sign_up
end

When /^I sign up without a password confirmation$/ do
  @visitor = FactoryGirl.build(:user, password_confirmation: '')
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign out$/ do
  visit '/auth/sign_out'
end

When /^I sign in with a wrong email$/ do
  @visitor = FactoryGirl.build(:user, email: 'wrong@example.com')
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = FactoryGirl.build(:user, password: 'wrongpass')
  sign_in
end

When /^I edit my account name$/ do
  click_link "Edit account"
  fill_in "user_name", with: "newname"
  fill_in "user_current_password", with: @visitor.password
  click_button "Update"
end

When /^I change my password$/ do  
  @current_password = @visitor.password
  @visitor = FactoryGirl.build(:user, password: 'newpassword', password_confirmation: 'newpassword')
  click_link "Edit account"  
  fill_in "user_password", with: @visitor.password
  fill_in "user_password_confirmation", with: @visitor.password_confirmation
  fill_in "user_current_password", with: @current_password
  click_button "Update"  
end

When /^I sign in$/ do
  sign_in
end

When /^I look at the list of users$/ do
  visit '/users'
end

## Then ##
Then /^I should see my name$/ do
  create_user
  page.should have_content @user.name
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I should see a successful sign up message$/ do
  page.has_content? "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "is invalid"
end
Then /^I should see a missing password message$/ do
  page.should have_content "can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "doesn't match confirmation"
end
