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
  end
  
  def edit
    @sprint = Sprint.find(params[:id])
  end
  
  def create
    authorize! :create, @project, :message => 'Not authorized as an administrator.'
    @sprint = Sprint.new(params[:sprint])
    if @sprint.save
      redirect_to sprints_path, :notice => "Sprint created."
    else      
      render action: "new", :alert => "Unable to create sprint."
    end
  end
  
  def update
    authorize! :update, @sprint, :message => 'Not authorized as an administrator.'    
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
