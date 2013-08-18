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
  scope :ordered, order('created_at DESC')

  def self.export(options = {})
    TaskExport.new(self, options).to_csv
  end
end
