class Task < ActiveRecord::Base
  STATUSES = %w(todo ongoing test done)

  validates :hours, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :storie, presence: true
  validates :sprint_id, presence: true
  validates :priority, :numericality => { :only_integer => true }

  has_many :users
  belongs_to :sprint

  attr_accessible :hours, :priority, :status, :storie, :sprint_id, :user_ids

  scope :names, select("distinct status").order('status desc')
  scope :ordered_by_last, order('created_at')

  def self.export(options = {})
    TaskExport.new(self, options).to_csv
  end
end
