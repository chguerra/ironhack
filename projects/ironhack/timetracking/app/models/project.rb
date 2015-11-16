class Project < ActiveRecord::Base
	def Project.iron_find(id)
		where(id: id).first
	end

	def self.this_is_no_blog_for_old_posts
		where('created_at < ?', 1.week.ago).destroy_all
	end

	def self.first_updated_projects(max)
		order('created_at DESC').limit(max)
	end

end
