class Entry < ActiveRecord::Base
	belongs_to :project
	validates  :hours, numericality: {only_integer: true, greater_than: 0}
	validates	:date, presence: true
	validates	:hours, presence: true
	validates	:minutes, presence: true
	validates	:project_id, presence: true
end
