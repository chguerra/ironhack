require 'rspec'
require_relative '../lib/post.rb'

describe Post do
	describe "#add_post" do
		before :each do
			@test_post = Post.new("Title 1","Text 1")
		end

			it "should return title for a new post" do
				expect(@test_post.title).to eq("Title 1")
			end

			it "should return text for a new post" do
				expect(@test_post.text).to eq("Text 1")
			end

			it "should return time/date format for a new post" do
			expect(@test_post.creation_date).to be_truthy
			end

			it "should return post id" do
			expect(@test_post.post_id).to eq(0)
			end
	end
end