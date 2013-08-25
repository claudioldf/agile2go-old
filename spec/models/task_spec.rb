require 'spec_helper'

describe Task do
  it { should validate_presence_of(:storie) }
  it { should validate_presence_of(:sprint_id) }
  it { should validate_presence_of(:status) }

  it { should_not allow_value("blah").for(:priority) }

  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }

  it { should have_many(:users) }
  it { should belong_to(:sprint) }

  it "should create a new task" do
    new_task = FactoryGirl.create(:task)
    new_task.should be_valid
  end
end
