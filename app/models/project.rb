class Project < ActiveRecord::Base
	has_many :users
	accepts_nested_attributes_for :users, :reject_if => :all_blank, :allow_destroy => true
  	attr_accessible :company, :description, :name
  	validates_presence_of :company, :description, :name
end
