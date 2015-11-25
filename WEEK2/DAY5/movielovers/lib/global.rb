class Global
	attr_accessor :global_movies, :global_number
	def initialize
		@global_movies = []
		@global_number = 0
		
	end
	def globalnumber
		@global_number
	end
	def setglobalnumber number
		@global_number = number
	end
	def globalmovies
		@global_movies
	end
	def setglobalmovies movies
		@global_movies = movies
	end
end