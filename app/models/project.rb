class Project < ActiveRecord::Base
  before_validation :generate_slug
  validates_presence_of :company, :description, :name

	has_many :users
  has_many :sprints
  has_many :tasks, :through => :sprints

  accepts_nested_attributes_for :users, :allow_destroy => true
  accepts_nested_attributes_for :sprints, :allow_destroy => true

  attr_accessible :company, :description, :name, :slug, :user_ids

  scope :names, select("name")
  scope :ordered, order(:name)
  scope :qty_tasks, ->(status, project_name) {
                                     select('count(tasks.id) as qtd').
                                     joins(:sprints, :tasks).
                                     where("tasks.status = ? and projects.name = ?", status, project_name).
                                     group('tasks.status') }

  def generate_slug
    self.slug ||= name.parameterize
  end

  def to_param
    slug
  end

  def self.export(options = {})
    ProjectExport.new(self, options).to_csv
  end
end
