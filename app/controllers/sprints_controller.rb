class SprintsController < ApplicationController
#  load_and_authorize_resource find_by: :slug, except: [:index]
  respond_to :html, :json
  helper_method :sprint
  respond_to :html, :json
  respond_to :xls, :js, only: :index

  def index
    @sprints = Sprint.search(params[:search])
    if stale? etag: @sprints.all, last_modified: @sprints.maximum(:updated_at)
      respond_with(@sprints) do |format|
        format.csv { send_data @sprints.export }
      end
    end
  end

  def create
    sprint.attributes=(sprint_params)
    flash[:notice] = 'Sprint created.' if sprint.save
    respond_with sprint, location: edit_sprint_path(sprint)
  end

  def update
    if sprint.update_attributes(sprint_params)
      flash[:notice] = 'Sprint updated.'
    else
      flash[:alert] =  'Unable to update project.'
    end
    respond_with sprint, location: edit_sprint_path(sprint)
  end

  def destroy
    sprint.destroy
    flash[:notice] = 'Sprint deleted.'
    respond_with sprint
  end

  private

  def sprint
    @cached_sprint ||= Sprint.find_or_initialize_by_slug(params[:id])
  end

  def sprint_params
    params.require(:sprint).permit(:name, :start_date, :end_date, :project_id)
  end
end
