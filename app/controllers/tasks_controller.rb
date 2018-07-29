class TasksController < ApplicationController
  before_action :set_todo, only: %i[new create update destroy]
  before_action :set_task, only: %i[edit update destroy]

  def new
    @task = @todo.tasks.build
    render layout: false
  end

  def create
    @task = @todo.tasks.create!(task_params)
    redirect_to @todo
  end

  def edit
    render layout: false
  end

  def update
    redirect_to @todo if @task.update(task_params)
  end

  def destroy
    redirect_to @todo if @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:id, :task, :todo_id, :completed_at)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
