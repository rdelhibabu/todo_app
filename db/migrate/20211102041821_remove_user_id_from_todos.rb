class RemoveUserIdFromTodos < ActiveRecord::Migration[6.1]
  def change
    remove_column :todos, :user_id, :string
    remove_column :todos, :bigint, :string
  end
end