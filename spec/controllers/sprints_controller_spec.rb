require 'spec_helper'

describe SprintsController, "#show" do
  context "index sprint" do
    before do
      get :show, slug: 'a2g-sprint1'
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end

describe SprintsController, "#index" do
  context "index sprint" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end
end

describe SprintsController, "#new" do
  context "new sprint" do
    before do
      get :new
    end

    it { should respond_with(302) }
    it { should redirect_to(root_path) }
    it { should set_the_flash.to('You are not authorized to access this page.') }
  end
end

