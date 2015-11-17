class ProjectsController < ApplicationController
	def index
		@projects = Project.first_updated_projects(10)
	end

    def show
        @project = Project.find_by(id: params[:id]) || 

        render_404(params) end
      
    end

    def render_404(params)
    	Rails.logger.warn("Tried to access #{params} which did not exist.")

    	render "layouts/404"

	end

