require 'spec_helper'

describe SprintsController, "#show" do
  context "for a fictional sprint" do
    before do
      get :show, slug: 'a2g-sprint1'
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
