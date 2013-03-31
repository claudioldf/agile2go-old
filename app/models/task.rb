class Task < ActiveRecord::Base
  belongs_to :sprint
  attr_accessible :hours, :priority, :status, :storie
end
