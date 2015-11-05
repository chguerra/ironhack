require 'pry'
require 'rspec'
require 'time'
require 'yaml/store'

module StorageFunctions

  def save
    @todo_store.transaction do
    	@todo_store[@user] = @tasks
    end
  end

  def load_tasks
    YAML::load("./public/tasks.yml")
  end 

end

class TodoList
	
	attr_reader :tasks

	def initialize(user)
		@todo_store = YAML::Store.new("./public/tasks.yml")
		@tasks = []
		@user = user
	end

	def add_task task
		@tasks << task
	end

	def delete_task(id)
		@tasks.delete_if {|task| task.id == id}
	end

	def find_task_by_id(id)
    	@tasks.find {|task| task.id == id}
  	end

  	def sort_by_created(order = "ASC")
    	if order == "DESC"
      		@tasks.sort {|task1,task2| task2.created_at <=> task1.created_at}
    	else
      		@tasks.sort {|task1,task2| task1.created_at <=> task2.created_at}
    	end
  	end
end