require 'spec_helper'

describe Project do	
		
	before(:each) do
		@attr = {
			:company => "Company Example",
			:description => "Company Example",
			:name => "Company Example",			
		}
	end

	it "should create a new project given a valid attribute" do
		Project.create! @attr
	end

	it "should required a project name" do
		no_project_name = Project.new @attr.merge(:name => "")
		no_project_name.should_not be_valid 
	end
	
	it "should be ok with a associated sprint" do
		project = Project.new @attr		
		project.sprints.build 
		project.should have(:no).errors_on(:sprints)		
	end			
	

end
