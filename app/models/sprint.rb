class Sprint < ActiveRecord::Base
  before_validation :generate_slug

  has_many :tasks
  belongs_to :project

  attr_accessible :daily_scrum, :end_date, :goal, :name, :start_date, :project_id, :slug

  validates :daily_scrum, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
  validates :goal, presence: true
  validates :name, presence: true
  validates :project_id, presence: true

  scope :ordered, order(:name)

  def generate_slug
    self.slug ||= name.parameterize
  end

  def to_param
    slug
  end

  def self.export(options = {})
    SprintExport.new(self, options).to_csv
  end

end
