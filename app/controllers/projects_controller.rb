class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @projects = Project.paginate :per_page => 5, :page => params[:page]
  end
  
  def show
    @project = Project.find(params[:id])    
  end
  
  def new
    @project = Project.new    
  end
  
  def edit
    #authorize! :index, @project, :message => 'Not authorized as an administrator.'
    @project = Project.find(params[:id])    
  end
  
  def create
    @project = Project.new(params[:project])

    #authorize! :save, @projects, :message => 'Not authorized as an administrator.'    
    if @project.save
      redirect_to projects_path, :notice => "Project updated."
    else
      redirect_to projects_path, :alert => "Unable to update project."
    end
  end
  
  def update
    authorize! :update, @projects, :message => 'Not authorized as an administrator.'    
    @project = Project.find(params[:id])
    
    if @project.update_attributes(params[:user], :as => :admin)
      redirect_to projects_path, :notice => "Project updated."
    else
      redirect_to projects_path, :alert => "Unable to update project."
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy    
    redirect_to projects_path, :notice => "Project deleted."
  end
end
