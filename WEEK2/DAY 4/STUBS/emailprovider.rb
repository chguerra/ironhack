require 'rspec'

class EmailProviderFake
	def initialize subjects
		@subjects = subjects
	end

	def get_subjects 
		@subjects
	end
end

class WordChecker
	def initialize subject_provider
		@subject_provider = subject_provider
	end

	def check words
		subjects = @subject_provider.get_subjects
		words.each do |element|
			if subjects.include?element
				element = 1
			else
				element = 0
			end
		end

		if words.reduce(0)
	end

end