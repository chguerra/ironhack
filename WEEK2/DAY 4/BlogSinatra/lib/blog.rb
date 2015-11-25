require 'time'
require_relative 'post.rb'

class Blog
	def initialize 
		@posts = []
	end
	def add_post post
		@posts << post
	end
	def posts
		@posts
	end
	def latest_posts
		@posts.sort{|post1,post2| post2.creation_date <=> post1.creation_date}
	end

end
