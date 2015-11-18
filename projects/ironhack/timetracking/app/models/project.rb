class Project < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 10}
	validates :name, format: {with: /(^[a-zA-Z0-9]*$)/}

	has_many :entries

	def self.iron_find(id)
		where(id: id).first
	end

	def self.this_is_no_blog_for_old_posts
		where('created_at < ?', 1.week.ago).destroy_all
	end

	def self.first_updated_projects(max)
		order('created_at DESC').limit(max)
	end
	def total_hours_in_month(month, year)
		from = Date.new(year, month, 1)
		to = from.end_of_month
		entries = self.entries.where(date: from..to)
		entries.reduce(0) do |sum, entry|
			sum += (entry.hours * 60) + entry.minutes
		end
	end
end
