require 'pry'
require 'rspec'


class Calc
	attr_accessor :number1, :number2, :operation
	
	def initialize(number1, number2, operation)
		@number1 = number1
		@number2 = number2
		@operation = operation
	end

	def add
		@number1 + @number2
	end

	def substract
		@number1 - @number2
	end

	def divide
		@number1 / @number2
	end

	def multiply
		@number1 * @number2
	end

	def selector
		case @operation
		when :add
			add
		when :divide
			divide
		when :substract
			substract
		when :multiply
			multiply
		else
			"Fallo"
		end
	end
end


class Memory
	def initialize result
		@result = result
		@file = 'public/memo.txt'
	end

	def write_memo
		IO.write(@file, @result)
	end

	def read_memo
	end
end

















