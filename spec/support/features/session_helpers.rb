module Features
  module SessionHelpers

    def sign_up_with(email, password)
      visit '/auth/sign_up'
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Sign up'
    end

    def sign_in
      user = FactoryGirl.create(:user)
      visit '/auth/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
    end
  end
end
