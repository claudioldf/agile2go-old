class Task < ActiveRecord::Base
  belongs_to :sprint
  attr_accessible :hours, :priority, :status, :storie, :sprint_id
  validates_presence_of :hours, :priority, :status, :storie, :sprint_id   

  scope :names, select("distinct status")

  def self.to_csv(options = {})
    CSV.generate(options) do |task|
      csv << column_names
        all.each do |task|
        csv << task.attributes.values_at(*column_names)
      end
    end
  end

end
