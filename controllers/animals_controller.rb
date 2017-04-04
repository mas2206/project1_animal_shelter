require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')

get '/animals' do
  @animals = Animal.all()
  erb(:'animals/index')
end

get '/animals/new' do
  erb(:'animals/new')
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to ('/animals')
end