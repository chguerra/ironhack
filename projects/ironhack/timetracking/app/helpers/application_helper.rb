require 'pry'
module ApplicationHelper
	def flash_message
		display_message(:alert) || display_message(:notice)
	end

	def total_hours
		@result = 0
		@entries.where("project_id = ?", params[:project_id]).each do |entry|
			
			@result = @result + entry.hours * 60 + entry.minutes
		end
		return "Total hours worked #{@result / 60} hours and #{@result % 60} minutes"
	end

	private

	def display_message(type)
		if flash[type]
			content_tag :div, class: type do
				content_tag :p do
					flash[type]
				end
			end
		end
	end

end
