class Person < ActiveRecord::Base
	has_many :participations
	has_many :projects, through: :participations
	validates :name, uniqueness: true

	def filter_projects
		Project.all.select	do |project|
			!self.projects.find_by(id: project.id)
		end
	end
end
