class Project < ActiveRecord::Base
	has_many :users
  has_many :sprints  
  accepts_nested_attributes_for :users, :allow_destroy => true  
  accepts_nested_attributes_for :sprints, :allow_destroy => true  
  attr_protected :company, :description, :name
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
