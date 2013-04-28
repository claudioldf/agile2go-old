class Project < ActiveRecord::Base
	has_many :users
  #has_many :sprints
  accepts_nested_attributes_for :users, :allow_destroy => true
  attr_accessible :company, :description, :name, :user_ids
  validates_presence_of :company, :description, :name

  scope :names, select("name")
  scope :qtd, select('count(t.id) as qtd').joins('join sprints s on s.project_id = projects.id join tasks t on t.sprint_id = s.id').group('projects.id, s.id, t.status')

  joins(":sprints => :tasks").select("distinct status")

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
        all.each do |project|
        csv << project.attributes.values_at(*column_names)
      end
    end
  end
  
end
