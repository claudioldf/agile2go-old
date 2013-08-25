require 'spec_helper'

describe Project do
	it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:slug) }

  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should have_many(:users) }
  it { should have_many(:sprints) }
  it { should have_many(:tasks).through(:sprints) }

	it "should create a new project" do
		project = FactoryGirl.create(:project)
		project.should be_valid
	end
end
