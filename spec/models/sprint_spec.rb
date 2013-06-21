require 'spec_helper'

# Returns a User instance that's not saved
# user = FactoryGirl.build(:user)

# Returns a saved User instance
# user = FactoryGirl.create(:user)

# Returns a hash of attributes that can be used to build a User instance
# attrs = FactoryGirl.attributes_for(:user)

# Returns an object with all defined attributes stubbed out
# stub = FactoryGirl.build_stubbed(:user)

# Passing a block to any of the methods above will yield the return object
# FactoryGirl.create(:user) do |user|
  # user.posts.create(attributes_for(:post))
# end

# Build a User instance and override the first_name property
# user = FactoryGirl.build(:user, first_name: "Joe")
# user.first_name
# => "Joe"

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
	 #  it "should sprint and project association be ok" do 	  	
		# sprint = FactoryGirl.build(:sprint)
		# sprint.project.build 
		# sprint.should have(:no).errors_on(:project)		
	 #  end				

	 #  it "should project and user association be ok" do 	  	
		# project = FactoryGirl.build(:project)		
		# project.should have(:no).errors_on(:users)		
	 #  end				

 	#   it "should associate sprint to project" do 	  	
		# project = FactoryGirl.build(:project)
		# project.sprints.build
		# expect(project.sprints.size).to eq 1
		# project.should have(:no).errors_on(:sprints)		
	 #  end				

	 #  it "should associate user to project" do 	  	
		# project = FactoryGirl.build(:project)
		# project.users.build
		# expect(project.users.size).to eq 1
		# project.should have(:no).errors_on(:users)		
	 #  end				
	end	

end
