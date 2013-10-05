class Project < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

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

  def self.search(search)
    return ordered unless search
    columns = %w(name description company).freeze
    tokens = search.split(/\s+/)
    conditions = tokens.collect do |token|
      columns.collect do |column|
        "#{column} like '%#{token}%'"
      end
    end
    conditions = conditions.flatten.join(" or ")
    where(conditions)
  end

  def generate_slug
    self.slug ||= self.name.parameterize if self.name
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
