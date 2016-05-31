require 'sinatra'
require 'pry'

get '/' do
  redirect '/ingredients'
end

get '/ingredients' do
  @ingredients = File.readlines('ingredients.txt')
  erb :index
end

post '/ingredients' do
  new_ingredient = params[:ingredient]
  
  File.open('ingredients.txt', 'a') do |file|
    file.puts(new_ingredient)
  end

  redirect '/ingredients'
end
