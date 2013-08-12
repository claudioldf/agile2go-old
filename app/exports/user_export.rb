class UserExport
	attr_reader :user

	def initialize(user, options = {})
		@user = user		
		@options = options
	end

	def to_csv	
		CSV.generate(@options) do |csv|
      csv << headers
        @user.all.each do |user|        
        csv << attributes_for(user)
        csv << user.roles.first.name unless user.roles.empty?        
      end
    end
	end

	private

	def headers
    %w(Name Email Registered Role)
  end

  def attributes_for(user)
    [user.name, user.email, user.created_at.to_date]    
  end

end