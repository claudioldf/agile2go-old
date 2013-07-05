module ControllerMacros

  def as_master
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.add_role :admin
      sign_in @user
    end
  end

  def as_team
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.add_role :team
      sign_in @user
    end
  end

  def as_po
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.add_role :po
      sign_in @user
    end
  end

end