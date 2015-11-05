require 'time'
require 'pry'

class Post
	attr_reader :title, :text, :creation_date, :post_id
	@@counter = 0
	def initialize title, text
		@title = title
		@text = text
		@post_id = @@counter
		@creation_date = Time.now
		@@counter += 1
	end
end
