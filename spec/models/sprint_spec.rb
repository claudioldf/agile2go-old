require 'spec_helper'

describe Sprint do

  it "should create a new sprint given a valid attribute" do
		sprint = FactoryGirl.create(:sprint)									
		sprint.should be_valid
	end

	describe "attributes validations" do
	  it "should required a name" do
	    no_sprint_name = FactoryGirl.build(:sprint, name: "")		
	    no_sprint_name.should_not be_valid 
	  end

	  it "should required a goal" do
	    no_sprint_goal = FactoryGirl.build(:sprint, goal: "")		
	    no_sprint_goal.should_not be_valid 
    end

    it "should required a daily scrum" do
	    no_daily_scrum = FactoryGirl.build(:sprint, daily_scrum: "")		
	    no_daily_scrum.should_not be_valid 
    end

    it "should required a start date" do
	    no_start_date = FactoryGirl.build(:sprint, start_date: "".to_date)		
	    no_start_date.should_not be_valid 
    end

    it "should required a end date" do
	    no_end_date = FactoryGirl.build(:sprint, end_date: "".to_date)		
	    no_end_date.should_not be_valid 
    end

    it "should required a project_id" do
	    no_project_id = FactoryGirl.build(:sprint, project_id: nil)		
	    no_project_id.should_not be_valid 
    end
	end		

	describe "associations" do
	  it "should sprint and project association be ok" do 	  	
			sprint = FactoryGirl.build(:sprint)			
			sprint.should have(:no).errors_on(:project)		
	  end				

	  it "should sprint and task association be ok" do 	  	
			sprint = FactoryGirl.build(:sprint)								
			sprint.should have(:no).errors_on(:tasks)		
			sprint.tasks.build
			expect(sprint.tasks.size).to eq 1			
	  end				 	  
	end	
end
