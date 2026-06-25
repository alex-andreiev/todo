# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  def index
    todos_scope = current_user.todos.includes(:tasks).order(position: :asc)
    @pagy, @todos = paginate(todos_scope)
    @todo = current_user.todos.build
  end

  def show
    tasks_scope = @todo.tasks.order(position: :asc)
    @pagy, @tasks = paginate(tasks_scope)
    @tasks_total_count = @pagy.count
    @open_tasks_count = @todo.tasks.where(completed_at: nil).count
    @completed_tasks_count = @todo.tasks.where.not(completed_at: nil).count
    @task = @todo.tasks.build
  end

  def new
    @todo = current_user.todos.build
  end

  def edit; end

  def create
    @todo = current_user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        flash.now[:notice] = t('flash.todo.created')
        format.turbo_stream
        format.html { redirect_to @todo, notice: t('flash.todo.created') }
      else
        format.turbo_stream { render :new, status: :unprocessable_content }
        format.html { render :new, status: :unprocessable_content }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        flash.now[:notice] = t('flash.todo.updated')
        format.turbo_stream
        format.html { redirect_to @todo, notice: t('flash.todo.updated') }
      else
        format.turbo_stream { render :edit, status: :unprocessable_content }
        format.html { render :edit, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @todo.destroy

    respond_to do |format|
      flash.now[:notice] = t('flash.todo.deleted')
      format.turbo_stream
      format.html { redirect_to todos_path, notice: t('flash.todo.deleted') }
    end
  end

  private

  def todo_params
    params.expect(todo: %i[title description])
  end

  def set_todo
    @todo = current_user.todos.find(params.expect(:id))
  end
end
