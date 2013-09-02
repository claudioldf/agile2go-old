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
      redirect_to users_path, notice: 'User updated.'
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  private

  def find_user
    @user ||= User.find_by_slug(params[:id])
  end
end
