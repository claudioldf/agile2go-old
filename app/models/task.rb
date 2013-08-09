class Task < ActiveRecord::Base
  STATUSES = %w(todo ongoing test done)

  has_many :users
  belongs_to :sprint
  
  attr_accessible :hours, :priority, :status, :storie, :sprint_id, :user_ids  

  validates :hours, presence: true  
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :storie, presence: true
  validates :sprint_id, presence: true
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
