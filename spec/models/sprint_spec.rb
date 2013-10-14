require 'spec_helper'

describe Sprint, 'attributes' do
  context 'validate attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:project_id) }
    it { should allow_value(Date.today).for(:start_date) }
    it { should allow_value(Date.today).for(:end_date) }

    it "create a new sprint" do
      sprint = FactoryGirl.create(:sprint)
      sprint.should be_valid
    end
  end
end

describe Sprint, 'associations' do
  it { should have_many(:tasks) }
  it { should belong_to(:project) }
end

describe Sprint, 'sprint public methods' do
  let(:s) { FactoryGirl.create(:sprint) }

  it 'generate slug' do
    expect(s.slug).to eq 'sprint-test'
  end
end

describe Sprint, 'queries' do

  context 'scopes' do
    it 'return sprint ordered' do
      expect(Sprint.ordered).to be_true
    end
  end

   context 'full-text search' do
    let(:s) { FactoryGirl.create(:sprint) }

    it 'search by name' do
     result =  Sprint.search(s.name)
     expect(result.size).to eq 1
    end

    it 'search by daily_scrum' do
      result = Sprint.search(s.daily_scrum)
      expect(result.size).to eq 1
    end

    it 'search by goal' do
      result = Sprint.search(s.goal)
      expect(result.size).to eq 1
    end

    it 'search by non-existing value' do
      result = Sprint.search('non-existing')
      expect(result.size).to eq 0
    end
  end
end
