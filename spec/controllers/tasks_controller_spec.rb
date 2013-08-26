require "spec_helper"

describe TasksController, "#show" do
  context "show task" do
    before do
      task = Task.create(status: 'todo', storie: 'bla', priority: 1, sprint_id: 1)
      task.save!
      get :show, id: task.id
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end

describe TasksController, "#index" do
  context "index task" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end
end

describe TasksController, "#new" do
  context "new task" do
    before do
      get :new
    end

    it { should respond_with(302) }
    it { should redirect_to(root_path) }
    it { should_not set_the_flash.to('"You are not authorized to access this page.') }
  end
end
