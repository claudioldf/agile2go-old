class SprintsController < ApplicationController
  before_filter :authenticate_user!   
  
  def index    
    @sprints = Sprint.order(:name)        
    respond_to do |format|
      format.html
      format.csv { send_data @sprints.to_csv }
      format.xls #{ send_data @sprints.to_csv(col_sep: "\t") }
    end
  end

  def show
    @sprint = Sprint.find(params[:id])    
  end
  
  def new    
    @sprint = Sprint.new    
    authorize! :new, @sprint, :message => 'Not authorized as an administrator.'
  end
  
  def edit    
    @sprint = Sprint.find(params[:id])
    authorize! :edit, @sprint, :message => 'Not authorized as an administrator.'
  end
  
  def create    
    @sprint = Sprint.new(params[:sprint])
    authorize! :create, @sprint, :message => 'Not authorized as an administrator.'
    if @sprint.save
      redirect_to sprints_path, :notice => "Sprint created."
    else      
      render action: "new", :alert => "Unable to create sprint."
    end
  end
  
  def update    
    @sprint = Sprint.find(params[:id])
    authorize! :update, @sprint, :message => 'Not authorized as an administrator.'    
    if @sprint.update_attributes(params[:sprint])
      redirect_to sprints_path, :notice => "Sprint updated."
    else      
      render action: "edit", :alert => "Unable to update project."
    end
  end
  
  def destroy    
    @sprint = Sprint.find(params[:id])
    authorize! :destroy, @sprint, :message => 'Not authorized as an administrator.'
    @sprint.destroy
    redirect_to sprints_path, :notice => "Sprint deleted."    
  end
end
