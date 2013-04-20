class Project < ActiveRecord::Base
	has_many :users
	accepts_nested_attributes_for :users, :allow_destroy => true
  	attr_accessible :company, :description, :name, :user_ids
  	validates_presence_of :company, :description, :name
end
