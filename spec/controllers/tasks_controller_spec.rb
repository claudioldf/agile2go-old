require "spec_helper"

describe TasksController, "#edit" do
  context "edit task" do
    before do
      task = Task.create(status: 'todo', storie: 'bla', priority: 1, sprint_id: 1)
      task.save!
      get :edit, id: task.id
    end

    it { should respond_with(:success) }
    it { should render_template(:edit) }
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

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end
end
