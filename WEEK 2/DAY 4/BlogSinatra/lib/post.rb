require 'time'
require 'pry'

class Post
	attr_reader :title, :text, :creation_date, :post_id, :category, :author
	@@counter = 0
	def initialize title, text, author
		@title = title
		@text = text
		@post_id = @@counter
		@creation_date = Time.now
		@@counter += 1
		@author = author
		@category = "default"
	end
end
