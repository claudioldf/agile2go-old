class User < ActiveRecord::Base
  before_save :create_avatar_url
  belongs_to :project
  rolify  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable  
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar_url, :project_id
  validates_presence_of :name, :email
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  private

	def prep_email
    	self.email = self.email.strip.downcase if self.email
	end  

	def create_avatar_url
   	 self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
	end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
        all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

end
