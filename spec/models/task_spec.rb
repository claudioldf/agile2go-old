require 'spec_helper'

describe Task, 'attributes' do
  it { should validate_presence_of(:storie) }
  it { should validate_presence_of(:sprint_id) }
  it { should validate_presence_of(:status) }

  it { should allow_value("todo").for(:status) }
  it { should_not allow_value("TODO").for(:status) }
  it { should_not allow_value("blah").for(:priority) }
  it { should validate_numericality_of(:priority) }

  it "should create a new task" do
    new_task = FactoryGirl.create(:task)
    new_task.should be_valid
  end
end

describe Task, 'associations' do
  it { should have_many(:users) }
  it { should belong_to(:sprint) }
end
