class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save!
      flash[:success] = "New Task created!"
      redirect_to task_path(@task)
    else
      flash[:danger] = "Task not created"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = "Updated task!"
      redirect_to task_path(@task)
    else
      flash[:danger] = "Not saved, please try again"
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task deleted."
      redirect_to '/tasks/'
  end

private
  def task_params
    params.require(:task).permit(:name, :description, :user_id, :location_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
