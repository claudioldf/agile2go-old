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
    #if stale? @tasks.last
      respond_with(@tasks) do |format|
        format.csv { send_data @tasks.export }
        format.xls
        format.js
      end
    #end
  end

  def create
    task.attributes=(task_params)
    if task.save
      redirect_to tasks_path, notice: 'Task created.'
    else
      users
      sprints
      render 'new', alert: 'Unable to create task.'
    end
  end

  def update
    if task.update_attributes(task_params)
      redirect_to edit_task_path(task), notice: 'Task updated.'
    else
      users
      sprints
      render 'edit', alert: 'Unable to update task.'
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
