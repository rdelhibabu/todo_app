class Todo < ActiveRecord::Base
  def to_pleasant_string
    display_status = completed ? "[X]" : "[ ]"
    "#{id}. #{display_status} #{todo_text} #{due_date.to_s(:long)}"
  end
end
