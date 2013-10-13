require 'spec_helper'

describe SprintsController, "#when goes to index page" do
  context "renders index sprint page" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end
end

describe SprintsController, "# when goes to new page" do
  context "renders new sprint page" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should_not set_the_flash }
  end
end

