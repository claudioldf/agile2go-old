class TasksController < ApplicationController
  before_filter :authenticate_user!
    
  def index
    @tasks = Task.order(:id)    

    puts ">>>>>> TASKS >>>>>>>>"
    @tasks.each_char { |t| t.id, t.status, t.sprint_id, t.sprint.name }

    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
      format.xls #{ send_data @tasks.to_csv(col_sep: "\t") }
    end
  end
  
  def show
    @task = Task.find(params[:id])    
  end
  
  def new    
    authorize! :new, @task, :message => 'Not authorized as an administrator.'              
    @task = Task.new        
    sprints    
  end
  
  def edit
    authorize! :edit, @task, :message => 'Not authorized as an administrator.'
    @task = Task.find(params[:id])
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
    authorize! :destroy, @task, :message => 'Not authorized as an administrator.'    
    @task = Task.find(params[:id])      
    if @task.update_attributes(params[:task], :as => :admin)
      redirect_to tasks_path, :notice => "Task updated."
    else      
      render action: "edit", :alert => "Unable to update task."
    end        
  end
  
  def destroy
    authorize! :destroy, @task, :message => 'Not authorized as an administrator.'
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, :notice => "Task deleted."    
  end  

  private
  
  def sprints
    @sprints = Array.new
      @list = Sprint.all
      @list.map do |s|
          @sprints << s.name + ' - ' + s.project.name
      end     
  end  

end
