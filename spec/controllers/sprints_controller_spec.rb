require 'spec_helper'

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

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end
end

