class ProjectsController < ApplicationController
#  load_and_authorize_resource find_by: :slug, except: [:index]
  before_filter :users, only: [:new, :edit]
  helper_method :project
  helper_method :users
  respond_to :html

  def index
    @projects = Project.ordered
 #   if stale? etag: @projects.all, last_modified: @projects.maximum(:updated_at)
      respond_with(@projects) do |format|
       format.csv { send_data @projects.export }
       format.xls
      end
  #  end
  end

  def create
    project.attributes=(project_params)
    if project.save
      redirect_to projects_path, notice: 'Project created.'
    else
      users
      render 'new', alert: 'Unable to create project.'
    end
  end

  def update
    if project.update_attributes(project_params)
      redirect_to projects_path, notice: 'Project successfully updated.'
    else
      users
      render 'edit', alert: 'Unable to update project.'
    end
  end

  def destroy
    project.destroy
    respond_with(project, notice: 'Project deleted.')
  end

  private

  def project
    @cached_project ||= Project.find_or_initialize_by_slug(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :company, users: [:name])
  end

  def users
    @cached_users ||= User.ordered
  end
end
