class TasksController < ApplicationController
  load_and_authorize_resource except: [:index]
  before_filter :users_and_sprints, only: [:new, :edit]
  respond_to :html, :xls, :js
  helper_method :task

  def index
    @tasks = Task.search(params[:status])
    respond_with(@tasks) do |format|
      format.csv { send_data @tasks.export }
    end
  end

  def create
    task.attributes=(params[:task])
    if task.save
      redirect_to tasks_path, notice: 'Task created.'
    else
      users_and_sprints
      render action: 'new', alert: 'Unable to create task.'
    end
  end

  def update
    if task.update_attributes(params[:task])
      redirect_to tasks_path, notice: 'Task updated.'
    else
      users_and_sprints
      render action: 'edit', alert: 'Unable to update task.'
    end
  end

  def destroy
    task.destroy
    redirect_to tasks_path, notice: 'Task deleted.'
  end

  private

  def users_and_sprints
    @sprints ||= Sprint.ordered
    @users ||= User.ordered
  end

  def task
    @cached_task ||= Task.find_or_initialize_by_id(params[:id])
  end
end
