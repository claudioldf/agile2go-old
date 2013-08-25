class Sprint < ActiveRecord::Base
  before_validation :generate_slug

  has_many :tasks
  belongs_to :project

  attr_accessible :daily_scrum, :end_date, :goal, :name, :start_date, :project_id, :slug

  validates :start_date, presence: true
  validates :name, presence: true
  validates :project_id, presence: true

  scope :ordered, order(:name)

  def generate_slug
    self.slug ||= param_name
  end

  def param_name
    self.name.parameterize if self.name
  end

  def to_param
    slug
  end

  def self.export(options = {})
    SprintExport.new(self, options).to_csv
  end

end
