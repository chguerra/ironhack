require 'sinatra'
require 'pry'
require './lib/imdbsearch.rb'
require './lib/global.rb'

glob = Global.new

get "/" do
	erb(:inputmovie)
end

post "/search" do
	title = params[:title]
	@movies = ImdbSearcher.new(title.to_s).validate_poster
	glob.setglobalmovies(@movies)
	glob.setglobalnumber(rand(9))
	@num = glob.globalnumber
	erb(:movieposters)
end

post "/guessyear" do
	result = params[:movie]
	@movies = glob.globalmovies
	@number = glob.globalnumber
	binding.pry	
	if glob.globalmovies[glob.globalnumber].id == glob.globalmovies.select{|movie| movie.id == result}
		'YES YOU MADE IT'
	else
		'CUNT YOU FAILED!'
	end

end
