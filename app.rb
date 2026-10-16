require_relative 'task'
require_relative 'task_repository'
require_relative 'controller'
require_relative 'router'

# 1. Setting up the DB
tasks_csv = "data/tasks.csv"
task_repository = TaskRepository.new(tasks_csv)
# 2. Creating the controller
controller = Controller.new(task_repository)
# 3. Creating the router
router = Router.new(controller)
# 4. starts the endless loop
router.run

# p task_repository.all
