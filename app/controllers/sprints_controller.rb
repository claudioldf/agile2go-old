class SprintsController < ApplicationController
  
  def index
    @sprints = Sprint.all              
  end
  
  def show
    @sprint = Sprint.find(params[:id])        
  end
  
  def new
    @sprint = Sprint.new
    @projects = Project.all        
  end
  
  def edit
    @sprint = Sprint.find(params[:id])
  end
  
  def create
    @sprint = Sprint.new(params[:sprint])
    
    if @sprint.save
      redirect_to @sprint, notice: 'Sprint was successfully created.'        
    else
      render action: "new"    
    end               
  end
  
  def update
    @sprint = Sprint.find(params[:id])
    
    if @sprint.update_attributes(params[:sprint])
      redirect_to @sprint, notice: 'Sprint was successfully updated.'        
    else
      render action: "edit"                   
    end
  end
  
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy        
  end
end
