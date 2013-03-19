class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email
  has_secure_password
end
