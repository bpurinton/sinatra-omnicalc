# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'
require 'sinatra/cookies'

# we need to require this gem to open a json URL
require "open-uri"

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

  cookies[:number_to_square] = @num
  cookies[:number_squared] = @square_of_num

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

get('/forex/:currency_one') do
  @currency_one = params.fetch("currency_one")
  url = "https://api.exchangerate.host/symbols"
  raw_data = URI.open(url).read
  parsed_data = JSON.parse(raw_data)
  @symbols = parsed_data.fetch("symbols").keys
  erb(:currency_convert)
end

get('/forex/:currency_one/:currency_two') do
  @currency_one = params.fetch("currency_one")
  @currency_two = params.fetch("currency_two")
  url = "https://api.exchangerate.host/convert?from=" + @currency_one + "&to=" + @currency_two
  raw_data = URI.open(url).read
  parsed_data = JSON.parse(raw_data)
  @rate = parsed_data.fetch("result")
  erb(:currency_conversion)
end
