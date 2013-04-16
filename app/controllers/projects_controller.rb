class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])    
  end
  
  def new
    @project = Project.new    
    #@users = User.all(order: 'name')
  end
  
  def edit
    #authorize! :index, @project, :message => 'Not authorized as an administrator.'
    @project = Project.find(params[:id])    
    #@users = User.all(order: 'name')
  end
  
  def create
    #authorize! :save, @projects, :message => 'Not authorized as an administrator.'        
    if @project.save
      redirect_to projects_path, :notice => "Project updated."
    else
      redirect_to projects_path, :alert => "Unable to update project."
    end
  end
  
  def update
    #authorize! :update, @projects, :message => 'Not authorized as an administrator.'        
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
