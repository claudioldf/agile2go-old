class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :index, @project, :message => 'Not authorized as an administrator.'
    @projects = Project.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @projects.to_csv }
      format.xls #{ send_data @projects.to_csv(col_sep: "\t") }
    end
  end
  
  def show
    @project = Project.find(params[:id])    
  end
  
  def new
    @project = Project.new        
    @users = User.all(order: 'name')
  end
  
  def edit
    authorize! :edit, @project, :message => 'Not authorized as an administrator.'
    @project = Project.find(params[:id])        
    @users = User.all(order: 'name')    
  end
  
  def create
    authorize! :create, @projects, :message => 'Not authorized as an administrator.'        
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path, :notice => "Project updated."
    else
      #redirect_to projects_path, :alert => "Unable to update project."
      render action: "new", :alert => "Unable to update project."
    end
  end
  
  def update
    authorize! :update, @projects, :message => 'Not authorized as an administrator.'        
    @project = Project.find(params[:id])    
    if @project.update_attributes(params[:project], :as => :admin)
      redirect_to projects_path, :notice => "Project updated."
    else      
      render action: "edit", :alert => "Unable to update project."
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy    
    redirect_to projects_path, :notice => "Project deleted."
  end
end
