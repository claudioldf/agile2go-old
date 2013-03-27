class Sprint < ActiveRecord::Base
  belongs_to :project
  attr_accessible :daily_scrum, :end_date, :goal, :name, :start_date, :project_id
end
