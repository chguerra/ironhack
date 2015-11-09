require 'imdb'
require 'pry'

class ImdbSearcher
	attr_reader :movie_title, :database
	def initialize movie_title
		@movie_title = movie_title
		@thechosen9 = []
		@database = Imdb::Search.new(@movie_title).movies.first(15)
	end
	def database
		@database
	end
	def validate_poster
		i = 0
			@database.each do |movie|
				if i < 9 && !movie.poster.nil?
					@thechosen9 << movie
					i = i + 1
				end
			end
			return @thechosen9
	end
	def find_movie movie_id
		@thechosen9.each do |movie|
			if movie.id == movie_id
				return movie
			end	
		end
	end
end
