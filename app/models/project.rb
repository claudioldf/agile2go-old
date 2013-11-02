class Project < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Searchable

  COLUMNS = %w(name description company)

  before_validation :generate_slug

  has_many :users
  has_many :sprints
  has_many :tasks, through: :sprints

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :sprints, allow_destroy: true

  validates :name, uniqueness: true, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :slug, presence: true

  scope :names, select(:name)
  scope :ordered, order(:name)
  scope :qty_tasks, ->(status, project_name) {
                                     select('count(tasks.id) as qtd').
                                     joins(:sprints, :tasks).
                                     where("tasks.status = ? and projects.name = ?", status, project_name).
                                     group('tasks.status') }

  def sprint_name
    self.sprints.last.name unless self.sprints.empty?
  end

  def to_param
    slug
  end

  def export(options = {})
    ProjectExport.new(self, options)
  end

  private

  def generate_slug
    self.slug ||= self.name.parameterize if self.name
  end
end
