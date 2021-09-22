# todos_conntroller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: todo #.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    new_user = User.create!(name: name, email: email)
    response_text = "Hey, your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated todo completed status to #{completed}"
  end
end
