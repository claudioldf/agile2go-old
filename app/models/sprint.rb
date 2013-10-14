class Sprint < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  DATE_REGEX = /^\d{4}-\d{2}-\d{2}/

  before_validation :generate_slug

  has_many :tasks
  belongs_to :project

  validates :start_date, presence: true , format: DATE_REGEX
  validates :end_date, format: DATE_REGEX
  validates :name, presence: true
  validates :project_id, presence: true

  scope :ordered, order(:name)

  def self.search(search)
    return ordered unless search
    columns = %w(name daily_scrum goal)
    tokens = search.split(/\s+/)
    conditions = tokens.collect do |token|
      columns.collect do |column|
        "#{column} like '%#{token}%'"
      end
    end
    conditions = conditions.flatten.join(" or ")
    where(conditions)
  end

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
