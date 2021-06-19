class TasksController < ApplicationController

  before_action :require_task, only: [:show, :edit, :update, :destroy, :mark_as_done]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to_task
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to_task
  end

  def mark_as_done
    @task.completed = true
    @task.save
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def require_task
    @task = Task.find(params[:id])
  end

  def redirect_to_task
    redirect_to task_path(@task)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
