require 'yaml/store'
require_relative 'task'

class TaskManager
  def self.database
    # holds info that was submitted
    @database ||= YAML::Store.new("db/task_manager")
  end

  def self.create(task)
    # opens file
    database.transaction do
      # find tasks section, make sure it's there or give empty array
      database['tasks'] ||= []
      database['total'] ||= 0
      # counter to setup id #
      database['total'] += 1
      database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    end
  end

  def self.all
    raw_tasks.map { |data| Task.new(data) }
  end

  def self.raw_tasks
    database.transaction do
      database['tasks'] || []
    end
  end

  def self.raw_task(id)
    raw_tasks.find { |task| task["id"] == id }
  end

  def self.find(id)
    Task.new(raw_task(id))
  end

end
