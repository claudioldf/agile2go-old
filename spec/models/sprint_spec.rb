require 'spec_helper'

describe Sprint, 'attributes' do
  context 'validate presence of attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:project_id) }
    it { should allow_value(Date.today).for(:start_date) }
    it { should allow_value(Date.today).for(:end_date) }
  end

  it "create a new sprint" do
    sprint = FactoryGirl.create(:sprint)
    sprint.should be_valid
  end
end

describe Sprint, 'associations' do
  it { should have_many(:tasks) }
  it { should belong_to(:project) }
end
