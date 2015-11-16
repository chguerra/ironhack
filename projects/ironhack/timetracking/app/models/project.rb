class Project < ActiveRecord::Base
	def Project.iron_find(id)
		where(id: id).first
	end

	def self.schwarzenegger
		where('created_at < ?', 1.week.ago).destroy_all
	end

end
