require 'spec_helper'

describe Project, 'attributes' do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:slug) }

  it "should create a new project" do
    project = FactoryGirl.create(:project)
    project.should be_valid
  end
end

describe Project, 'associations' do
  it { should have_many(:users) }
  it { should have_many(:sprints) }
  it { should have_many(:tasks).through(:sprints) }

  it { should accept_nested_attributes_for(:users) }
  it { should accept_nested_attributes_for(:sprints).allow_destroy(true) }
end
