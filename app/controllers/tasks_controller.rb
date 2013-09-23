class TasksController < ApplicationController
 # load_and_authorize_resource except: [:index]
  before_filter :users, only: [:new, :edit]
  before_filter :sprints, only: [:new, :edit]
  respond_to :html
  helper_method :task
  helper_method :users
  helper_method :sprints

  def index
    @tasks = Task.search(params[:status])
    respond_with(@tasks) do |format|
      format.csv { send_data @tasks.export }
      format.xls
      format.js
    end
  end

  def create
    task.attributes=(task_params)
    if task.save
      respond_with(task, notice: 'Task created.')
    else
      users
      sprints
      render action: 'new', alert: 'Unable to create task.'
    end
  end

  def update
    if task.update_attributes(task_params)
      respond_with(task, notice: 'Task updated.')
    else
      users
      sprints
      render action: 'edit', alert: 'Unable to update task.'
    end
  end

  def destroy
    task.destroy
    respond_with(task, notice: 'Task deleted.')
  end

  private

  def task_params
    params.require(:task).permit(:status, :storie, :priority, users: [:name, :id])
  end

  def users
    @cached_users ||= User.ordered
  end

  def sprints
    @cached_sprints ||= Sprint.ordered
  end

  def task
    @cached_task ||= Task.find_or_initialize_by_id(params[:id])
  end
end
