class TasksController < ApplicationController
  def index
    @tasks  = Task.order('limit_date').all
    @status = ['todo', 'doing', 'done']  
  end

  def create
    Task.create(task_params)
    redirect_to '/tasks', notice: 'タスクを作成しました。'
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
    @status = ['todo', 'doing', 'done']
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to '/tasks', notice: 'タスクを更新しました。'
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to action: :index
  end

  private
  def task_params
    params.permit(:state, :task, :limit_date)
  end

end
