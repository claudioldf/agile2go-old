require 'spec_helper'

describe ProjectsController, "#show" do
  context "for a fictional project" do
    before do
      get :show, slug: 'some-slug'
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
