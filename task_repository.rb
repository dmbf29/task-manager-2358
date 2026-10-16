require 'csv'
# Storing all of our tasks -> acting as our DB
# talk to the CSV

class TaskRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path # storing where our csv file is
    @tasks = [] # an array of Task INSTANCES
    load_csv
  end

  def create(task)
    @tasks << task
    save_csv
  end

  def all
    @tasks
  end

  private

  def save_csv
    #  - CSVtoo simple, only strings
    # break our instnaces down into an array of string
    CSV.open(@csv_file_path, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      task = Task.new(row[0])
      @tasks << task
    end
  end


end
