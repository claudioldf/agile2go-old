class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, Project, :message => 'Not authorized as an administrator.'
    @projects = Project.ordered
    respond_to do |format|
      format.html
      format.csv { send_data @projects.to_csv }
      format.xls #{ send_data @projects.to_csv(col_sep: "\t") }
    end
  end

  def show
    authorize! :show, @project, :message => 'Not authorized as an administrator.'
  end

  def new
    @project = Project.new
    authorize! :new, @project, :message => 'Not authorized as an administrator.'
    users
  end

  def edit
    authorize! :edit, @project, :message => 'Not authorized as an administrator.'
    users
  end

  def create
    @project = Project.new(params[:project])
    authorize! :create, @project, :message => 'Not authorized as an administrator.'
    if @project.save
      redirect_to projects_path, :notice => "Project created."
    else
      users
      render action: "new", :alert => "Unable to create project."
    end
  end

  def update
    authorize! :update, @project, :message => 'Not authorized as an administrator.'
    if @project.update_attributes(params[:project])
      redirect_to projects_path, :notice => "Project updated."
    else
      users
      render action: "edit", :alert => "Unable to update project."
    end
  end

  def destroy
    authorize! :destroy, @project, :message => 'Not authorized as an administrator.'
    @project.destroy
    redirect_to projects_path, :notice => "Project deleted."
  end

  private

  def find_project
    @project = Project.find_by_slug!(params[:id])
  end

  def users
    @users = User.ordered
  end

end
