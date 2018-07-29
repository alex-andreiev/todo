class TodosController < ApplicationController
  before_action :set_todo, only: :show

  def index
    @todos = Todo.all
  end

  def show
    @tasks = @todo.tasks
  end

  def new
    @todo = Todo.new
    render layout: false
  end

  def create
    @todo = Todo.create(todo_params)
    redirect_to @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
