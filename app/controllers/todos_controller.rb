# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  def index
    @todos = current_user.todos
  end

  def show
    @tasks = @todo.tasks.order(priority: :desc)
  end

  def new
    @todo = Todo.new
    render layout: false
  end

  def create
    @todo = current_user.todos.create(todo_params)
    redirect_to @todo
  end

  def edit
    render layout: false
  end

  def update
    redirect_to todos_path if @todo.update(todo_params)
  end

  def destroy
    redirect_to todos_path if @todo.destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:user_id, :title, :description)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
