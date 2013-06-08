require 'spec_helper'

describe Task do
	
	before(:each) do
		@attr = {			
			:hours => "08:00",
			:priority => 1,
			:status => "Status Example",
			:storie => "Storie Example",
			:sprint_id => 1
		}
	end

	it "should create a new task given a valid attribute" do
		Task.create! @attr
	end

	it "should require a task story" do
		no_story = Task.new @attr.merge(:storie => "")
		no_story.should_not be_valid 
	end
	
	it "should require a sprint_id on a given task" do	
		no_sprint = Task.new @attr.merge(:sprint_id => nil)
		no_sprint.should_not be_valid
	end	
	

end
