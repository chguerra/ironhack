require 'pry'

class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		@entries = @project.entries
		@total_hours = @project.total_hours_in_month(11,2015) / 60
		@minutes = @project.total_hours_in_month(11,2015) % 60
		@prev_project = @project.id - 1
		@next_project = @project.id + 1
	end
end
 		