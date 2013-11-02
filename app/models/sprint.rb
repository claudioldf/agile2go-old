class Sprint < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Searchable

  DATE_REGEX = /^\d{4}-\d{2}-\d{2}/
  COLUMNS = %w(id name daily_scrum goal)

  before_validation :generate_slug

  has_many :tasks
  belongs_to :project

  validates :start_date, presence: true , format: DATE_REGEX
  validates :end_date, format: DATE_REGEX
  validates :name, presence: true
  validates :project_id, presence: true

  scope :ordered, order(:name)

  def self.export(options = {})
    SprintExport.new(self, options).to_csv
  end

  def project_name
    project.name
  end

  private

  def generate_slug
    self.slug ||= param_name
  end

  def param_name
    self.name.parameterize if self.name
  end
end
