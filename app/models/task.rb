class Task < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  STATUSES = %w(todo ongoing test done).freeze

  has_many :users
  belongs_to :sprint

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :storie, presence: true
  validates :sprint_id, presence: true
  validates :priority, numericality: { only_integer: true }

  scope :names, select("distinct status").order('status desc')
  scope :ordered, order('created_at DESC')

  def self.search(search)
    return ordered unless search
    columns = %w(status storie priority hours id).freeze
    tokens = search.split(/\s+/)
    conditions = tokens.collect do |token|
      columns.collect do |column|
        "#{column} like '%#{token}%'"
      end
    end
    conditions = conditions.flatten.join(" or ")
    where(conditions)
  end

  def self.search_by_status(status)
    return where('status like ?', '%todo%') unless status
    where('status like ?', "%" + status + "%")
  end

  def self.export(options = {})
    TaskExport.new(self, options).to_csv
  end

  def is_status
    StatusTask.new(self)
  end
end
