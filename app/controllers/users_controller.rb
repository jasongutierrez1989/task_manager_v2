class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #scope :admin?, -> { where(admin: true)}

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User was created successfully!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Information not saved, try again"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Updated Profile!"
      redirect_to user_path
    else
      flash[:danger] = "Not saved, please try again"
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    redirect_to '/'
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :job, :admin, :id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
