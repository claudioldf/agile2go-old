class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
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

  def new    
    @user = User.new    
  end

  def edit
    #authorize! :edit, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
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