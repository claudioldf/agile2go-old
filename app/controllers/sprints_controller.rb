class SprintsController < ApplicationController
  before_filter :authenticate_user!   
  before_filter :find_sprint, only: [:show, :edit, :update, :destroy]
  
  def index    
    @sprints = Sprint.order(:name)        
    respond_to do |format|
      format.html
      format.csv { send_data @sprints.export }
      format.xls #{ send_data @sprints.to_csv(col_sep: "\t") }
    end
  end

  def show    
  end
  
  def new    
    @sprint = Sprint.new    
    authorize! :new, @sprint, :message => 'Not authorized as an administrator.'
  end
  
  def edit        
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
    authorize! :update, @sprint, :message => 'Not authorized as an administrator.'    
    if @sprint.update_attributes(params[:sprint])
      redirect_to sprints_path, :notice => "Sprint updated."
    else      
      render action: "edit", :alert => "Unable to update project."
    end
  end
  
  def destroy        
    authorize! :destroy, @sprint, :message => 'Not authorized as an administrator.'
    @sprint.destroy
    redirect_to sprints_path, :notice => "Sprint deleted."    
  end

  private 

  def find_sprint
    @sprint = Sprint.find_by_slug!(params[:id])   
  end

end
