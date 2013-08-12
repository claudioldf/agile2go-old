require 'spec_helper'

describe Project do

	it "should create a new project given a valid attribute" do
		project = FactoryGirl.create(:project)
		project.should be_valid
	end


	describe "attributes validations" do
	  it "should required a name" do
	    no_project_name = FactoryGirl.build(:project, name: "")
	    no_project_name.should_not be_valid
	  end

	  it "should required a company" do
	    no_project_name = FactoryGirl.build(:project, company: "")
	    no_project_name.should_not be_valid
      end

    it "should required a description" do
	    no_project_name = FactoryGirl.build(:project, description: "")
	    no_project_name.should_not be_valid
     end
	end

	describe "associations" do
	  it "should project and sprint association be ok" do
			project = FactoryGirl.build(:project)
			project.sprints.build
			project.should have(:no).errors_on(:sprints)
	  end

	  it "should project and user association be ok" do
			project = FactoryGirl.build(:project)
			project.should have(:no).errors_on(:users)
	  end

 	  it "should associate sprint to project" do
			project = FactoryGirl.build(:project)
			project.sprints.build
			expect(project.sprints.size).to eq 1			
	  end

	  it "should associate user to project" do
			project = FactoryGirl.build(:project)
			project.users.build
			expect(project.users.size).to eq 1			
	  end
	end

end
