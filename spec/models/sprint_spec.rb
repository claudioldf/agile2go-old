require 'spec_helper'

describe Sprint do

  before(:each) do
		@attr = {
			:daily_scrum => "10:00",
			:start_date => "01/10/2013".to_date,
			:end_date => "10/10/2013".to_date,
			:goal => "Goal Example",
			:name => "Sprint Name Example",			
			:project_id => 1
		}
	end

	it "should create a new sprint given a valid attribute" do
		Sprint.create! @attr
	end

	it "should required a sprint name" do
		no_sprint_name = Sprint.new @attr.merge(:name => "")
		no_sprint_name.should_not be_valid 
	end

	it "should be ok with a associated task" do
		sprint = Sprint.new @attr		
		sprint.tasks.build 
		sprint.should have(:no).errors_on(:taks)		
	end			

	it "should have at least one associated project" do
		sprint = Sprint.new @attr		
		sprint.project_id.should be(1)
	end				

end
