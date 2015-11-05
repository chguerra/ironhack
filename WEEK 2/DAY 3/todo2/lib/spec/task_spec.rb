require_relative '../task.rb'
require 'rspec'

describe "Task"	do
	
	describe "#task"	do
		it "check if completed status is false at creation"	do
			@task = Task.new("Buy the milk")
			expect(@task.complete?).to be false
		end

		it "check if a task is completed after using complete! method" do
			@task = Task.new("Buy the milk")
			expect(@task.complete!).to be true
		end

		it "check if the task gets incomplete status after calling make_incomplete!" do
			@task = Task.new("Buy the milk")
			expect(@task.make_incomplete!).to be false
		end

		it "checks the content loaded to the task" do
			@task = Task.new("Buy the milk")
			@task.update_content!("Jauja")
			expect(@task.content).to eq("Jauja")
		end


	end
end