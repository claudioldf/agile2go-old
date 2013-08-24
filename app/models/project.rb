class Project < ActiveRecord::Base
  before_validation :generate_slug

  attr_accessible :company, :description, :name, :slug, :user_ids

	has_many :users
  has_many :sprints
  has_many :tasks, :through => :sprints

  accepts_nested_attributes_for :users, :allow_destroy => true
  accepts_nested_attributes_for :sprints, :allow_destroy => true

  validates :name, uniqueness: true, presence: true
  validates :company, presence: true
  validates :description, presence: true

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

  def sprint_name
    self.sprints.last.name unless self.sprints.empty?
  end
end
