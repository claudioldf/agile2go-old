class SprintsController < ApplicationController
#  load_and_authorize_resource find_by: :slug, except: [:index]
  respond_to :html
  helper_method :sprint

  def index
    @sprints = Sprint.order(:name)
    respond_with(@sprints) do |format|
      format.csv { send_data @sprints.export }
      format.xls
    end
  end

  def create
    sprint.atttibutes=(sprint_params)
    if sprint.save
      respond_with(sprint, notice: 'Sprint created.')
    else
      render action: 'new', alert: 'Unable to create sprint.'
    end
  end

  def update
    if sprint.update_attributes(sprint_params)
      respond_with(sprint, notice: 'Sprint updated.')
    else
      render action: 'edit', alert: 'Unable to update project.'
    end
  end

  def destroy
    sprint.destroy
    respond_with(sprint, notice: 'Sprint deleted.')
  end

  private

  def sprint
    @cached_sprint ||= Sprint.find_or_initialize_by_slug(params[:id])
  end

  def sprint_params
    params.require(:sprint).permit(:name, :start_date, :end_date, project: [:name, :id])
  end
end
