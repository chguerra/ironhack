require 'sinatra'
require 'rspec'
include Marshal
require_relative 'lib/post.rb'
require_relative 'lib/blog.rb' 

blog = File.open('data.marshal','r'){|from_file| Marshal.load(from_file)}


get "/" do 
	'Hello world!'
end

get "/posts" do
	@blog = blog
	erb(:posts)
end

get "/latestposts" do
	@blog = blog.latest_posts
	erb(:latestposts)
end

get "/post_details/:id" do
	post_id = params[:id].to_i
	@blog = blog
	@post_id = post_id
	erb(:showpost)
end

get "/newpost" do
	erb(:newpost)
end

post "/addpost" do
	title = params[:title]
	text = params[:text]
	author = params[:author]
	blog.add_post(Post.new(title.to_s,text.to_s,author.to_s))
	File.open('data.marshal','w'){|to_file|Marshal.dump(blog, to_file)}
	redirect '/latestposts'
end

