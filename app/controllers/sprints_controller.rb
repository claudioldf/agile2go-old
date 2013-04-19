class SprintsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @sprints = Sprint.all    
  end

  def show
    @sprint = Sprint.find(params[:id])    
  end
  
  def new
    @sprint = Sprint.new    
  end
  
  def edit
    @sprint = Sprint.find(params[:id])
  end
  
  def create
    @sprint = Sprint.new(params[:sprint])
    if @sprint.save
      redirect_to sprints_path, :notice => "Sprint updated."
    else      
      render action: "new", :alert => "Unable to create project."
    end
  end
  
  def update
    #authorize! :update, @sprint, :message => 'Not authorized as an administrator.'    
    @sprint = Sprint.find(params[:id])
    if @sprint.update_attributes(params[:sprint], :as => :admin)
      redirect_to sprints_path, :notice => "Sprint updated."
    else      
      render action: "edit", :alert => "Unable to update project."
    end
  end
  
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    redirect_to sprints_path, :notice => "Sprint deleted."    
  end
end
