class Sprint < ActiveRecord::Base
  belongs_to :project
  #has_many :tasks
  attr_accessible :daily_scrum, :end_date, :goal, :name, :start_date, :project_id
  validates_presence_of :daily_scrum, :end_date, :goal, :name, :start_date, :project_id

  def self.to_csv(options = {})
    CSV.generate(options) do |sprint|
      csv << column_names
        all.each do |sprint|
        csv << sprint.attributes.values_at(*column_names)
      end
    end
  end

end
