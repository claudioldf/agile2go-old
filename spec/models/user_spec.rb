require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:slug) }

  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should belong_to(:project) }
  it { should belong_to(:task) }

  it "should create a new user" do
    new_user = FactoryGirl.create(:user)
    new_user.should be_valid
  end
end

describe User, "email validations"  do
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = FactoryGirl.build(:user, email: address)
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = FactoryGirl.build(:user, email: address)
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    user = FactoryGirl.create(:user)
    user_with_duplicate_email = FactoryGirl.build(:user, email: user.email)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = 'example@example.com'.upcase
    user = FactoryGirl.create(:user, email: upcased_email)
    user_with_duplicate_email = FactoryGirl.build(:user, email: user.email)
    user_with_duplicate_email.should_not be_valid
  end
end

describe User, "passwords validations" do
  it "should require a matching password confirmation" do
    user_with_invalid_pass_confirmation = FactoryGirl.build(:user, password_confirmation: "invalid")
    user_with_invalid_pass_confirmation.should_not be_valid
  end

  it "should reject short passwords" do
    short = "a" * 5
    user_with_short_pass = FactoryGirl.build(:user, password: short, password_confirmation: short)
    user_with_short_pass.should_not be_valid
  end
end
