class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task, only: [:show, :edit, :update, :destroy]
  before_filter :list_users_and_sprints, only: [:new, :edit]

  def index
    @tasks = Task.cached_tasks
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
      format.xls #{ send_data @tasks.to_csv(col_sep: "\t") }
    end
  end

  def show
  end

  def new
    @task = Task.new
    authorize! :new, @task, :message => 'Not authorized as an administrator.'
  end

  def edit
    authorize! :edit, @task, :message => 'Not authorized as an administrator.'
  end

  def create
    @task = Task.new(params[:task])
    authorize! :create, @task, :message => 'Not authorized as an administrator.'
    if @task.save
      redirect_to tasks_path, :notice => "Task created."
    else
      render action: "new", :alert => "Unable to create task."
    end
  end

  def update
    if @task.update_attributes(params[:task])
      authorize! :update, @task, :message => 'Not authorized as an administrator.'
      redirect_to tasks_path, :notice => "Task updated."
    else
      render action: "edit", :alert => "Unable to update task."
    end
  end

  def destroy
    @task.destroy
    authorize! :destroy, @task, :message => 'Not authorized as an administrator.'
    redirect_to tasks_path, :notice => "Task deleted."
  end

  private

  def list_users_and_sprints
    @users = User.all(order: 'name')
    @sprints = Sprint.all(order: 'name')
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
