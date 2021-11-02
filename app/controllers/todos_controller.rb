# todos_conntroller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = current_user.todos.find(id)
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    user_id = current_user.id

    new_todo = Todo.new(todo_text: todo_text,
                        due_date: due_date, completed: false, user_id: user_id)

    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
