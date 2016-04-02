class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.paginate(page: params[:page],per_page: 15)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => "User deleted"
  end
  
end
