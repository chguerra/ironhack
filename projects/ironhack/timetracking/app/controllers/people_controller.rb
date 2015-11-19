class PeopleController < ApplicationController
	def new
		@person = Person.new
	end

	def show
		@person = Person.find(params[:id])
		@project = @person.filter_projects

	end

	def update	
		@person = Person.find(params[:id])
		@project = Project.find(params[:project_id])
		
		if @person.projects << @project
		redirect_to action: 'show', controller: 'people', id: @person.id
		else
			
		end

	end

	def edit

	end

	def create
		@person = Person.new(entry_params)
		if @person.save
			redirect_to action: 'show', controller: 'people', id: @person.id
		else
			render 'new'
		end
	end
	private 

	def entry_params
		params.require(:person).permit(:name, :id)
	end
end
