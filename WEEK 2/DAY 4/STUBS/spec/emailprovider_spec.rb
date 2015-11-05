require_relative '../emailprovider.rb'

describe "Word counter" do
	describe "Email provider has no strings" do
		it "should return true if no words given" do
			provider = EmailProviderFake.new([])
			counter = WordChecker.new(provider)
			expect(counter.check([])).to eq(true)
		end

		#it "should return false for a word with" do
			#FAKES--------------
			#provider = EmailProviderFake.new([])
		#	counter = WordChecker.new(provider)
			#expect(counter.check(["hola"])).to eq(false)	
		#end
	end

	it "should return true when a word is included in a subject" do
		#provider = EmailProviderFake.new(["hola"])
		#STUB------------------
		provider = instance_double("EmailProvider", :get_subjects => ["hola"])
		counter = WordChecker.new(provider)
		expect(counter.check(["hola"])).to eq(true)	
	end

	it "should return true for two words included in the same subject" do
	provider = instance_double("EmailProvider", :get_subjects => ["hola que tal"])
	counter = WordChecker.new(provider)	
	expect(counter.check(["hola","tal"])).to eq(true)
	end
	
end	