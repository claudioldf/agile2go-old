require 'will_paginate/array'

class TasksController < ApplicationController
 # load_and_authorize_resource except: [:index]
  before_filter :users, only: [:new, :edit]
  before_filter :sprints, only: [:new, :edit]
  respond_to :html
  helper_method :task
  helper_method :users
  helper_method :sprints

  def index
    @tasks = Task.search(params[:status]).paginate(page: params[:page], per_page: 12)
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
    flash[:notice] = 'Task created.' if task.save
    respond_with task, location: edit_task_path(task)
  end

  def update
    if task.update_attributes(task_params)
      flash[:notice] = 'Task updated.'
    else
      flash[:alert] = 'Unable to update task.'
    end
    respond_with task, location: edit_task_path(task)
  end

  def destroy
    task.destroy
    flash[:notice] = 'Task deleted.'
    respond_with task
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
