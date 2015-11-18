class ProjectsController < ApplicationController
	def index
		if Project.first_updated_projects(100).empty?
			render 'layouts/no_projects'
		else
			@projects = Project.first_updated_projects(100)
		end
		
	end

    def show
        @project = Project.find_by(id: params[:id]) || 

        render_404(params) end
      
    end

    def render_404(params)
    	Rails.logger.warn("Tried to access #{params} which did not exist.")

    	render "layouts/404"

	end

