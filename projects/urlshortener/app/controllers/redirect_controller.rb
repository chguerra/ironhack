require 'pry'

class RedirectController < ApplicationController
	def redirect
		#recibe url y hace redir
		redirect_to Url.find_by(shortened_url: params[:url]).url
		 	
	end
end
