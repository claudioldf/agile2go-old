require 'spec_helper'

describe ProjectsController, "#show" do
  context "show project" do
    before do
      get :show, slug: 'some-slug'
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end

describe ProjectsController, "#index" do
  context "index project" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end
end

describe ProjectsController, "#new" do
  context "new project" do
    before do
      get :new
    end

    it { should respond_with(302) }
    it { should redirect_to(root_path) }
    it { should set_the_flash.to('You are not authorized to access this page.') }
  end
end
