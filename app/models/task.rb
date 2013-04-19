class Task < ActiveRecord::Base
  belongs_to :sprint
  attr_accessible :hours, :priority, :status, :storie, :sprint_id
  validates_presence_of :hours, :priority, :status, :storie, :sprint_id   
end
