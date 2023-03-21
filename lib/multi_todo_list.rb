class TodoList
  def initialize
    @todo_list = []
  end

  def add(task) # task is an instance of the Task class
    @todo_list << task
    # adds Task to TodoList
    # returns nothing
  end

  def view
    @todo_list
    # returns list of tasks
  end
end
