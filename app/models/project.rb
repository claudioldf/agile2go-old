class Project < ActiveRecord::Base
  before_validation :generate_slug

	has_many :users
  has_many :sprints   
  
  accepts_nested_attributes_for :users, :allow_destroy => true  
  accepts_nested_attributes_for :sprints, :allow_destroy => true  
  attr_accessible :company, :description, :name, :slug, :user_ids
  validates_presence_of :company, :description, :name
  
  scope :names, select("name")  
  scope :qty_tasks, ->(status, project_name) {
                                     select('count(t.id) as qtd').                                     
                                     joins('join sprints s on s.project_id = projects.id join tasks t on t.sprint_id = s.id').
                                     where("t.status = ? and projects.name = ?", status, project_name).                                     
                                     group('t.status') }

  def generate_slug
    self.slug ||= name.parameterize
  end

  def to_param
    slug    
  end

  private                                  

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << %w(Name Description Company Registered)
        all.each do |project|
        csv << [project.name, project.description, project.company, project.created_at.to_date]
      end
    end
  end
  
end
