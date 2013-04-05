class SprintsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @sprints = Sprint.paginate :per_page => 5, :page => params[:page]
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
      redirect_to sprints_path, :alert => "Unable to update sprint."
    end
  end
  
  def update
    #authorize! :update, @sprint, :message => 'Not authorized as an administrator.'    
    @sprint = Sprint.find(params[:id])
  
    if @sprint.update_attributes(params[:user], :as => :admin)
      redirect_to sprints_path, :notice => "Sprint updated."
    else
      redirect_to sprints_path, :alert => "Unable to update sprint."
    end
  end
  
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    redirect_to sprints_path, :notice => "Sprint deleted."    
  end
end
