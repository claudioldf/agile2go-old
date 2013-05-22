class HomeController < ApplicationController
  
  def index
    @projects = Project.all    
	@tasks = Task.names
  end

end
