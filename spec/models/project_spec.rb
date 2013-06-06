require 'spec_helper'

describe Project do
  
	before(:each) do
		@attr = {
			:company => "Company Example",
			:description => "Company Example",
			:name => "Company Example"
		}
	end

	it "should create a new project given a valid attribute" do
		Project.create! @attr
	end

	it "should required a project name" do
		no_project_name = Project.new @attr.merge(:name => "")
		no_project_name.should_not be_valid 
	end

end
