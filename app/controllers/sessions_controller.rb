class SessionsController < ApplicationController
  before_action :require_login, only: [:logout]
  before_action :set_user, only: [:home]

  def welcome
  end

  def home
  end

  def new
    @user = User.new
    render 'login'
  end

  def login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to login_path
    else
      redirect_to login_path
    end
  end

  def logout
    if session[:user_id]
      session.clear
      redirect_to root_path
    else
      redirect_to home_path
    end
  end

  private

  def set_user
    @user = User.find_by(:id => session[:user_id])
  end
end
