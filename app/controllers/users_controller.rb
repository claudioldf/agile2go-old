class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug, only: [:show,  :destroy]
  before_filter :find_user
  respond_to :html

  def index
    @users = User.order(:name)
      respond_with(@users) do |format|
        format.csv { send_data @users.export }
        format.xls
    end
  end

  def update
    if @user.update_attributes(user_params)
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

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user ||= User.find_by_slug(params[:id])
  end
end
