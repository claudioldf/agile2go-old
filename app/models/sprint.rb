class Sprint < ActiveRecord::Base
  belongs_to :project
  attr_accessible :and_date, :daily_scrum, :goal, :name, :start_date
end
