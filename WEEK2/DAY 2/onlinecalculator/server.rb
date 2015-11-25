require "sinatra"
require_relative "lib/calc.rb"

get "/home" do
  erb(:home)
end

post "/home" do
	erb(:home)
	first = params[:number1].to_f
	second = params[:number2].to_f
	operation = params["operation"].to_s
	result = Calc.new(first,second,operation.to_sym).selector

	memory = Memory.new(result).write_memo

	"#{first} #{second} = #{result}"
end
