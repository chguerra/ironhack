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

	def new
		@project = Project.find_by(id: params[:project_id])
		@entry = @project.entries.new
	end

	def create
		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params

		if @entry.save
			flash[:notice] = 'Entry saved succesfuly'
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		else
			flash[:alert] = 'No no no, no has puesto la palabra magica'
			render 'new'
		end			
		
	end

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find(params[:id])
	end

	def update
		@project = Project.find params[:project_id]
		@entry = @project.entries.find(params[:id])
		if @entry.update_attributes(entry_params)
			redirect_to action: 'index', controller: 'entries'
		else
			render 'edit'
		end	
	end

	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find(params[:id])

		@entry.destroy

		redirect_to action: 'index', controller: 'entries'

	end


	private 

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)
	end
end
 		