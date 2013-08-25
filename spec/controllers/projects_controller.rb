require 'spec_helper'

describe ProjectsController, "#show" do
  context "for a fictional project" do
    before do
      get :show, id: 1
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
    it { should rescue_from(ActiveRecord::RecordNotFound).with(:render_404) }
  end
end
