require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    erb :name
  end

  get '/square/:number' do
    @number = params[:number].to_i
    @answer = @number * @number
    "#{@answer}"
  end

  get '/say/:number/:phrase' do
    final_string = ""
    (params[:number].to_i).times do
      final_string += "#{params[:phrase]}"
    end
    final_string
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]
    "#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}."
  end

  get '/:operation/:number1/:number2' do
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i
      if params[:operation] == "add"
        answer = @number1 + @number2
      elsif params[:operation] == "subtract"
        answer = @number1 - @number2
      elsif params[:operation] == "multiply"
        answer = @number1 * @number2
      elsif params[:operation] == "divide"
        answer = @number1 / @number2
      else
        "Unable to process requested operation"
      end
     answer.to_s
    end

end