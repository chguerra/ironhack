require 'sinatra'
require 'pry'
require './lib/imdbsearch.rb'


get "/" do
	erb(:inputmovie)
end

post "/search" do
title = params[:title]
@database = ImdbSearcher.new(title.to_s).database
@movies = @database.validate_poste
erb(:movieposters)
end

post "/guessyear" do
	
end
