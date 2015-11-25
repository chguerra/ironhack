require_relative '../calc.rb'

RSpec.describe Calc do 
	describe "#add" do
		it "give the method to numbers and expect their adition" do
			@calc = Calc.new(5,2,:add)
			expect(@calc.add).to eq(7)
		end
	end

	describe "#substract" do
		it "give the method to numbers and expect their substraction" do
			@calc = Calc.new(5,2,:add)
			expect(@calc.substract).to eq(3)
		end
	end

	describe "#divide" do
		it "give the method to numbers and expect their division" do
			@calc = Calc.new(6,2,:add)
			expect(@calc.divide).to eq(3)
		end
	end

	describe "#multiply" do
		it "give the method to numbers and expect their division" do
			@calc = Calc.new(6,2,:add)
			expect(@calc.multiply).to eq(12)
		end
	end

	describe "#selector" do
		it "give the method the operation and expect to add two numbers" do
			@calc = Calc.new(5,2,:add)
			expect(@calc.selector).to eq(7)
		end

		it "give the method the operation and expect to add two numbers" do
			@calc = Calc.new(5,2,:multiply)
			expect(@calc.selector).to eq(10)
		end

		it "give the method the operation and expect to add two numbers" do
			@calc = Calc.new(24,2,:divide)
			expect(@calc.selector).to eq(12)
		end

		it "give the method the operation and expect to add two numbers" do
			@calc = Calc.new(5,2,:substract)
			expect(@calc.selector).to eq(3)
		end
	end

end
