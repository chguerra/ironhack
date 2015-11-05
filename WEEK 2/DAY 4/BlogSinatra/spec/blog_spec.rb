require 'rspec'
require_relative '../lib/post.rb'
require_relative '../lib/blog.rb'

describe Blog do
	describe "#blog_methods" do
		before :each do
			@post1 = Post.new("Title 1","Text 1")
			@post2 = Post.new("Title 2","Text 2")
			@blog = Blog.new
		end

		it "should return an array with the post when using add_post" do
			expect(@blog.add_post(@post1)).to eq([@post1])
		end


	end
end