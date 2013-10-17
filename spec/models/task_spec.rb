require 'spec_helper'

describe Task, 'attributes' do
  context 'validate attributes' do
    it { should validate_presence_of(:storie) }
    it { should validate_presence_of(:sprint_id) }
    it { should validate_presence_of(:status) }

    it { should allow_value("todo").for(:status) }
    it { should_not allow_value("TODO").for(:status) }
    it { should_not allow_value("blah").for(:priority) }
    it { should validate_numericality_of(:priority) }

    it "create a new task" do
      new_task = FactoryGirl.create(:task)
      new_task.should be_valid
    end
  end
end

describe Task, 'associations' do
  it { should have_many(:users) }
  it { should belong_to(:sprint) }
end

describe Task, 'queries' do

  let(:t) { FactoryGirl.create(:task) }

  context 'scopes' do
    it 'return task ordered' do
      t.save!
      expect(Task.ordered.size).to eq 1
    end

    it 'return all tasks by todo status' do
     result =  Task.search_by_status(t.status)
     expect(result.size).to eq 1
    end

    it 'return all tasks by done status' do
     done_task = FactoryGirl.create(:task, status: 'done')
     result =  Task.search_by_status(done_task.status)
     expect(result.size).to eq 1
    end
  end

   context 'full-text search' do
    it 'search by id' do
     result =  Task.search(t.id)
     expect(result.size).to eq 1
    end

    it 'search by non-existing value' do
      result = Task.search('non-existing')
      expect(result.size).to eq 0
    end
  end
end

