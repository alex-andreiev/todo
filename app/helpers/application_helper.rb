# frozen_string_literal: true

module ApplicationHelper
  def breadcrumbs(todo: nil, task: nil)
    crumbs = []
    crumbs << { name: t('buttons.todolist'), path: todos_path }

    crumbs << { name: todo.title, path: todo_path(todo) } if todo

    crumbs << { name: task.task, path: todo_task_path(todo, task) } if task

    crumbs
  end
end
