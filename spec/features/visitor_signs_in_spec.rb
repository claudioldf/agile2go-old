require 'spec_helper'

feature 'Visitor signs in' do

  scenario 'with valid email and password' do
    sign_in
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'I see the tasks dashboard' do

  end

  scenario 'And the projects dashboard' do

  end

end
