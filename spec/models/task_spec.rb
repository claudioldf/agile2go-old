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

	describe "attributes" do

		it "should require hours" do
			no_hours = Task.new @attr.merge(:hours => nil)
			no_hours.should_not be_valid 
		end				

		it "should accept only numbers on a given hour" do
			pending "alter column hours from string to integer"
			#hours_string = Task.new @attr.merge(:hours => "string")
			#hours_string.should_not be_valid 
		end		

		it "should require priority" do
			priority_string = Task.new @attr.merge(:priority => nil)
			priority_string.should_not be_valid 
		end		

		it "should accept only numbers on a given priority" do
			priority_string = Task.new @attr.merge(:priority => "string")
			priority_string.should_not be_valid 
		end		

		it "should require story" do
			no_story = Task.new @attr.merge(:storie => "")
			no_story.should_not be_valid 
		end		

	end
	
	
	describe "assosiations" do
		it "should require a sprint on a given task" do	
			no_sprint = Task.new @attr.merge(:sprint_id => nil)
			no_sprint.should_not be_valid
		end		

		it "should have at least one associated task" do
			task = Task.new @attr		
			task.sprint_id.should be(1)
		end					
	end	

end
