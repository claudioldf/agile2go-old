require 'spec_helper'

describe Project, 'attributes' do
  context 'validate attibutes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:slug) }

    it "create a new project" do
      project = FactoryGirl.create(:project)
      project.should be_valid
    end
  end
end

describe Project, 'associations' do
  it { should have_many(:users) }
  it { should have_many(:sprints) }
  it { should have_many(:tasks).through(:sprints) }

  it { should accept_nested_attributes_for(:users) }
  it { should accept_nested_attributes_for(:sprints).allow_destroy(true) }
end

describe Project, 'public methods' do
  let(:p) { FactoryGirl.create(:project) }

  it 'generate slug' do
    expect(p.slug).to eq 'project-test'
  end
end

describe Project, 'queries' do
  context 'scopes' do
    it 'return project names' do
      expect(Project.names).to be_true
    end

    it 'return project ordered' do
      expect(Project.ordered).to be_true
    end
  end

  context 'full-text search' do
    let(:p) { FactoryGirl.create(:project) }

    it 'search by name' do
     result =  Project.search(p.name)
     expect(result.size).to eq 1
    end

    it 'search by campany' do
      result = Project.search(p.company)
      expect(result.size).to eq 1
    end

    it 'search by description' do
      result = Project.search(p.description)
      expect(result.size).to eq 1
    end

    it 'search by non-existing value' do
      result = Project.search('non-existing')
      expect(result.size).to eq 0
    end
  end
end
