# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_todo
  before_action :set_task, only: %i[show edit update destroy]

  def show; end

  def new
    @task = @todo.tasks.build
  end

  def edit; end

  def create
    @task = @todo.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        flash.now[:notice] = t('flash.task.created')
        format.turbo_stream
        format.html { redirect_to todo_task_path(@todo, @task), notice: t('flash.task.created') }
      else
        format.turbo_stream { render :new, status: :unprocessable_content }
        format.html { render :new, status: :unprocessable_content }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        flash.now[:notice] = t('flash.task.updated')
        format.turbo_stream
        format.html { redirect_to @todo, notice: t('flash.task.updated') }
      else
        format.turbo_stream { render :edit, status: :unprocessable_content }
        format.html { render :edit, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      flash.now[:notice] = t('flash.task.deleted')
      format.turbo_stream
      format.html { redirect_to @todo, notice: t('flash.task.deleted') }
    end
  end

  private

  def task_params
    params.expect(task: %i[task completed_at attachment priority deadline])
  end

  def set_todo
    @todo = current_user.todos.find(params.expect(:todo_id))
  end

  def set_task
    @task = @todo.tasks.find(params.expect(:id))
  end
end
