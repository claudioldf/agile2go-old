class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index    
    @users = User.order(:name)
      respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls #{ send_data @users.to_csv(col_sep: "\t") }
    end
  end

  def show    
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :master)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    #unless @user == current_user
      @user.destroy
      redirect_to users_path, :notice => "User deleted."
    #else
     # redirect_to users_path, :notice => "Can't delete yourself."
    #end
  end
  
end