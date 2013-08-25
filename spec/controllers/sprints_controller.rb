require 'spec_helper'

describe SprintsController, "#show" do
  context "for a fictional sprint" do
    before do
      get :show, id: 1
    end

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
    it { should rescue_from(ActiveRecord::RecordNotFound).with(:render_404) }
  end
end
