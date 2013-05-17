class Project < ActiveRecord::Base
	has_many :users
  accepts_nested_attributes_for :users, :allow_destroy => true
  attr_accessible :company, :description, :name, :user_ids
  validates_presence_of :company, :description, :name

  scope :names, select("name")  
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << %w(Name Description Company Registered)
        all.each do |project|
        csv << [project.name, project.description, project.company, project.created_at.to_date]
      end
    end
  end
  
end
