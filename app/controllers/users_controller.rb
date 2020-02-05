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
      flash[:danger] = "Information not saved, try again"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Updated Profile!"
      redirect_to user_path
    else
      flash[:danger] = "Not saved, please try again"
      render 'edit'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :job)
  end
end
