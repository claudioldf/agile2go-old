class Task < ActiveRecord::Base

  belongs_to :sprint
  has_many :users
  attr_accessible :hours, :priority, :status, :storie, :sprint_id, :user_ids
  validates_presence_of :hours, :priority, :status, :storie, :sprint_id
  validates :priority, :numericality => { :only_integer => true }

  scope :names, select("distinct status").order('status desc')
  scope :ordered_by_last, order('created_at desc')

  private

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << csv_headers
        all.each do |task|
        csv << csv_attrs_for(task)
      end
    end
  end

  def self.csv_headers
    %w(Id Status Priority Hours Registered Sprint Project)
  end

  def self.csv_attrs_for(task)
    [task.id, task.status, task.priority, task.hours, task.created_at.to_date, task.sprint.name, task.sprint.project.name]
  end


end
