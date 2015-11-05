require_relative '../task.rb'
require_relative '../todolist.rb'
require 'rspec'

describe "TodoList"  do
	describe "#add_task" do
		it "check the task is added to the TodoList" do
			@task = Task.new("The cake is a lie")
			@list = TodoList.new
			@list.add_task(@task)
			expect(@list.tasks[0]).to_not be_nil
		end

		it "add a task, delete it and check if it's deleted" do
			@task = Task.new("The cake is a lie")
			@list = TodoList.new
			@list.add_task(@task)
			@list.delete_task(6)
			expect(@list.tasks).to eq([])
		end
	end
end