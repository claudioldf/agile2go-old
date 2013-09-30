class HomeController < ApplicationController
  respond_to :html

  def index
    @projects = Project.ordered
    @tasks = Task.names
  #  if stale? etag: @projects.all, last_modified: @projects.maximum(:updated_at)
      respond_with @projects
   # end
  end
end
