class Sprint < ActiveRecord::Base  
  before_validation :generate_slug

  has_many :tasks
  belongs_to :project
  attr_accessible :daily_scrum, :end_date, :goal, :name, :start_date, :project_id, :slug
  validates_presence_of :daily_scrum, :end_date, :goal, :name, :start_date, :project_id

  scope :ordered, order(:name)

  def generate_slug
    Slug.new(self).generate
  end

  def to_param
    slug
  end

  def self.export(options = {})
    SprintExport.new(self, options).to_csv
  end
  
end
