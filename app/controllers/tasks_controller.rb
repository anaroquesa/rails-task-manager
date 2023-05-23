class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def edit
    id = params[:id]
    @task = Task.find(id)
    @task.save
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    id = params[:id]
    @task = Task.find(id)
    @task.delete
    redirect_to tasks_path(@tasks)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
