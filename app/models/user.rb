class User < ActiveRecord::Base
  before_save :create_avatar_url
  before_validation :prep_email
  attr_accessible :email, :name, :password, :password_confirmation, :avatar_url
  validates_presence_of :email, :name, :password, :password_confirmation
  validates_confirmation_of :password
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email
  has_secure_password

  private

  def prep_email
    self.email = self.email.strip.downcase if self.email
  end

  def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
   end

end
