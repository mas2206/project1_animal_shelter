require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/adoption')

get '/adoptions' do
  @adoptions = Adoption.all()
  erb(:'adoptions/index')
end

get '/adoptions/new' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:'adoptions/new')
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save()
  redirect to ('/adoptions')
end