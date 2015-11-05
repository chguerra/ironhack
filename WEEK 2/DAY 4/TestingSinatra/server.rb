require 'sinatra'

get "/" do
	'Home page'
end

get "/real_page" do
	'This is a fucking real page'
end

get "/hi"	do
	redirect "/real_page"
end
