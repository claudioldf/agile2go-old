require 'spec_helper'

describe Project, 'attributes' do
  context 'validate presence of attibutes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:slug) }
  end

  it "create a new project" do
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

describe Project, 'queries' do
  context 'full-text search' do
    let(:p) { FactoryGirl.create(:project) }
    it 'search by name' do
      Project.search(p.name).should be_true
    end

    it 'search by campany' do
      Project.search(p.company).should be_true
    end

    it 'search by description' do
      Project.search(p.description).should be_true
    end
  end
end
