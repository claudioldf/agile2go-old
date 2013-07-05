class Project < ActiveRecord::Base
  before_validation :generate_slug

	has_many :users
  has_many :sprints
  has_many :tasks, :through => :sprints

  accepts_nested_attributes_for :users, :allow_destroy => true
  accepts_nested_attributes_for :sprints, :allow_destroy => true

  attr_accessible :company, :description, :name, :slug, :user_ids
  validates_presence_of :company, :description, :name

  scope :names, select("name")
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

  private

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_headers
        all.each do |project|
        csv << csv_attrs_for(project)
      end
    end
  end

  def self.csv_headers
    %w(Name Description Company Registered)
  end

  def self.csv_attrs_for(project)
    [project.name, project.description, project.company, project.created_at.to_date]
  end

end
