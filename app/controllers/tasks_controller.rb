class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :edit, :update, :destroy]  
    
  def index
    @tasks = Task.all         
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
      format.xls #{ send_data @tasks.to_csv(col_sep: "\t") }
    end
  end
  
  def show
    
  end
  
  def new    
    authorize! :new, @task, :message => 'Not authorized as an administrator.'              
    @task = Task.new        
    users
    sprints    
  end
  
  def edit
    authorize! :edit, @task, :message => 'Not authorized as an administrator.'    
    users
    sprints
  end
  
  def create
    authorize! :create, @task, :message => 'Not authorized as an administrator.'
    @task = Task.new(params[:task])    
    if @task.save
      redirect_to tasks_path, :notice => "Task created."
    else
      render action: "new", :alert => "Unable to create task."    
    end        
  end
  
  def update
    authorize! :update, @task, :message => 'Not authorized as an administrator.'        
    if @task.update_attributes(params[:task])
      redirect_to tasks_path, :notice => "Task updated."
    else      
      render action: "edit", :alert => "Unable to update task."
    end        
  end
  
  def destroy
    authorize! :destroy, @task, :message => 'Not authorized as an administrator.'    
    @task.destroy
    redirect_to tasks_path, :notice => "Task deleted."    
  end  

  private
  
  def users
    @users = User.all(order: 'name')
  end

  def sprints    
    @sprints = Sprint.all(order: 'name')      
  end  

  def find_task
    @task = Task.find(params[:id])   
  end

end
