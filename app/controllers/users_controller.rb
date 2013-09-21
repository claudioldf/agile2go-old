class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug, only: [:show,  :destroy]
  before_filter :find_user
  respond_to :html, :xls

  def index
    @users = User.order(:name)
      respond_with(@users)  do |format|
        format.csv { send_data @users.export }
    end
  end

  def update
    if @user.update_attributes(params[:user], as: :master)
      respond_with(@users, notice: 'User updated.')
    else
      respond_with(users, alert: 'Unable to update user.')
    end
  end

  def destroy
    @user.destroy
    respond_with(@users, notice: 'User deleted.')
  end

  private

  def find_user
    @user ||= User.find_by_slug(params[:id])
  end
end
