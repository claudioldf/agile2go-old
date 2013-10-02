class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug, only: [:show,  :destroy]
  before_filter :find_user
  respond_to :html

  def index
    @users = User.order(:name)
    if stale? etag: @users.all, last_modified: @users.maximum(:updated_at)
      respond_with(@users) do |format|
        format.csv { send_data @users.export }
        format.xls
      end
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated.'
    else
      flash[:alert] = 'Unable to update user.'
    end
    respond_with @user
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User deleted.'
    respond_with @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user ||= User.find_by_slug(params[:id])
  end
end
