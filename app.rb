# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

get('/') do
  redirect('/square/new')
end

get('/square/new') do
  erb(:square_form)
end
