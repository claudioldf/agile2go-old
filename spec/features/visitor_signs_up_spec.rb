require 'spec_helper'

feature 'Visitor signs in' do

  let(:visitor) { FactoryGirl.create(:user) }

  scenario 'with valid email and password' do
    sign_in_with(visitor.email, visitor.password)
    expect(page).to have_content('Logout')
  end

  def sign_in_with(email, password)
    visit '/auth/sign_in'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign in'
  end
end
