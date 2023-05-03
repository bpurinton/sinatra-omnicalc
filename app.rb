# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

require "open-uri"
# require "json"

get('/') do
  redirect('/square/new')
end

get('/square/new') do
  puts params
  erb(:square_form)
end

get('/square/results') do
  # puts params
  # params = {"elephant"=>"42"}
  
  @num = params.fetch("elephant").to_f
  @square_of_num = @num * @num

  erb(:square_results)
end

get('/random/results') do
  # puts params
  # params = {"user_min"=>"1.5", "user_max"=>"4.5"}

  @lower = params.fetch("user_min").to_f
  @upper = params.fetch("user_max").to_f
  
  erb(:random_results)
end

get('/dice/:number/:sides') do
  # puts params
  # params = {"number"=>"4", "sides"=>"5"}

  @number_of_dice = params.fetch("number")
  @sides_per_dice = params.fetch("sides")

  erb(:dice_roll)
end

get('/forex') do
  url = "https://api.exchangerate.host/symbols"
  raw_data = URI.open(url).read
  parsed_data = JSON.parse(raw_data)
  @symbols = parsed_data.fetch("symbols").keys
  erb(:currency_list)
end
