# data + behavior

# Model -> setting the rules and behavior for one instance in our app
class Task
  attr_reader :description # task.description -> allows the user to read the description

  def initialize(description)
    @description = description
    @done = false
  end

  # task.done?
  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end
