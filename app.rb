# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

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
