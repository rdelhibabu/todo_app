class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def self.overdue
    where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.due_today
    where(due_date: Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.add_task(todo)
    todo_text = todo[:todo_text]
    due_date = Date.today + todo[:due_in_days]
    create!(todo_text: todo_text, due_date: due_date, completed: false)
  end

  def self.mark_as_complete(todo_id)
    todo_for_completion = find(todo_id)
    todo_for_completion.completed = true
    todo_for_completion.save
    return todo_for_completion
  end
end
