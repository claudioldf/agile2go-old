class HomeController < ApplicationController

  def index
    @projects = Project.paginate :per_page => 3, :page => params[:page]
	  @tasks = Task.names
  end

end
