class ContactsController < ApplicationController
	def index
		@contact = Contact.all
		render 'index'
	end
end
