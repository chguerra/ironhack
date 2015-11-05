require 'sinatra'
require 'rspec'
require_relative 'lib/post.rb'
require_relative 'lib/blog.rb' 

blog = Blog.new
blog.add_post(Post.new("My first post","This is the text for my first post"))
blog.add_post(Post.new("My second post","This is the text for my second post"))
blog.add_post(Post.new("This is not a post","The cake is a lie"))

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
	blog.add_post(Post.new(title.to_s,text.to_s))
	redirect '/latestposts'
end

