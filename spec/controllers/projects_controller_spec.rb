require 'spec_helper'

describe ProjectsController, "#index" do
  context "it renders index project page" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end
end

describe ProjectsController, "#new" do
  context "it renders new project page" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end
end
