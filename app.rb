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
  puts params
  erb(:square_results)
end
