class ProjectsController < ApplicationController
  load_and_authorize_resource find_by: :slug, except: [:index]
  before_filter :users, only: [:new, :edit]
  helper_method :project
  helper_method :users

  def index
    @projects = Project.ordered
    respond_to do |format|
      format.html
      format.csv { send_data @projects.export }
      format.xls
    end
  end

  def create
    project.attributes=(params[:project])
    if project.save
      redirect_to projects_path, :notice => "Project created."
    else
      users
      render action: "new", :alert => "Unable to create project."
    end
  end

  def update
    if project.update_attributes(params[:project])
      redirect_to projects_path, :notice => "Project updated."
    else
      users
      render action: "edit", :alert => "Unable to update project."
    end
  end

  def destroy
    project.destroy
    redirect_to projects_path, :notice => "Project deleted."
  end

  private

  def project
    @cached_project ||= Project.find_or_initialize_by_slug(params[:id])
  end

  def users
    @cached_users ||= User.ordered
  end

end
