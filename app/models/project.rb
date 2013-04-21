class Project < ActiveRecord::Base
	has_many :users
	accepts_nested_attributes_for :users, :allow_destroy => true
  	attr_accessible :company, :description, :name, :user_ids
  	validates_presence_of :company, :description, :name

  	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
        all.each do |project|
        csv << project.attributes.values_at(*column_names)
      end
    end
  end

end
