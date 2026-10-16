class View
  # no initialize
  # no require_relative
  # ONLY puts and gets.chomp

  def display_tasks(tasks)
    # tasks is an array of instances
    tasks.each_with_index do |task, index|
      xmark = task.done? ? 'X' : ' '
      puts "#{index + 1}.) [#{xmark}] - #{task.description}"
    end
  end

  def ask_for_description
    puts "What's the task?"
    return gets.chomp
  end

  def ask_for_index
    puts "What number?"
    return gets.chomp.to_i - 1
  end
end
