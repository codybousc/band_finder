require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
also_reload('lib/**/*.rb')
require('./lib/band')
require('./lib/venue')
require('pg')
require('pry')


get ('/') do
  @all_venues = Venue.all()
  erb(:index)
end

get ('/venues/new') do
  erb(:venue_form)
end

post ('/venues') do
  name = params.fetch("name")
  new_venue = Venue.create({:name => name})
  @all_venues = Venue.all()
  erb(:index)
end

get ('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  @bands = @venue.bands
  erb(:venue)
end
