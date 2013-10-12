class ProjectsController < ApplicationController
#  load_and_authorize_resource find_by: :slug, except: [:index]
  before_filter :users, only: [:new, :edit]
  helper_method :project
  helper_method :users
  respond_to :html, :json

  def index
    @projects = Project.search(params[:search])
    if stale? etag: @projects.all, last_modified: @projects.maximum(:updated_at)
      respond_with(@projects) do |format|
        format.csv { send_data @projects.export }
        format.xls
        format.js
      end
    end
  end

  def create
    project.attributes=(project_params)
    flash[:notice] = 'Project created.' if project.save
    respond_with project, location: edit_project_path(project)
  end

  def update
    flash[:notice] = 'Project updated.' if project.update_attributes(project_params)
    respond_with project, location: edit_project_path(project)
  end

  def destroy
    project.destroy
    flash[:notice] = 'Project deleted.'
    respond_with project
  end

  private

  def project
    @cached_project ||= Project.find_or_initialize_by_slug(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :company, user_ids: [])
  end

  def users
    @cached_users ||= User.ordered
  end
end
