class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was created successfully!"
      redirect_to user_path @user
    else
      render 'new'
      flash[:danger] = "Information not saved, try again"
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :job)
  end
end
