class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug, only: [:show, :update, :destroy]

  def index
    @users = User.order(:name)
      respond_to do |format|
        format.html
        format.csv { send_data @users.export }
        format.xls
    end
  end

  def update
    if @user.update_attributes(params[:user], :as => :master)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def find_user
    @user ||= User.find_by_slug(params[:id])
  end

end
