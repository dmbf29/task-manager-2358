require_relative 'view'
# Handle user actions -> talk to everyone who needs to make that action happen
# NEVER PUTS INSIDE THE CONTROLLER

class Controller
  def initialize(task_repository)
    # already created, it's storing our tasks
    @task_repository = task_repository
    @view = View.new # just for puts / gets.chomp
  end

  # display all of my tasks to the users
  def list
    # you have access to all instance variables inside of an instance method
    tasks = @task_repository.all
    # display the the task to the user
    @view.display_tasks(tasks)
  end

  # asking the user what task they want to add into the app
  def add
    # tell the view to get a description from the user
    description = @view.ask_for_description
    # create an instance of a task with the description
    task = Task.new(description)
    # give that task to the repository
    @task_repository.create(task)
  end

  def mark_as_done
    # get all the tasks from the repository
    tasks = @task_repository.all
    # give them to the view to display
    @view.display_tasks(tasks)
    # ask the user for the index of the task
    index = @view.ask_for_index
    # get the task using the index from the tasks array
    task = tasks[index]
    # mark the task as done
    task.mark_as_done!
  end

  private

  # def display_tasks
end
