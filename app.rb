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

post ('/bands') do
  name = params.fetch("name")
  new_band = Band.create({:name => name})
  venue_id = params.fetch("venue_id")
  @venue = Venue.find(venue_id)
  @venue.bands.push(new_band)
  @bands = @venue.bands
  if new_band.save()
  erb(:venue)
  else
    erb(:errors)
  end
end

get ('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band_id = @band.id()
  @band_name = @band.name().strip
  @bands = Band.all()
  @all_venues = Venue.all()

  #venue_id = params.fetch("venue_id")



  erb(:band)
end

patch('/bands/:id') do
  name = params.fetch("name")
  @band = Band.find(params.fetch("id").to_i())
  @band_id = @band.id()
  @band.update({:name => name})
  @bands = Band.all()
  @all_venues = Venue.all()
  erb(:band)
end

delete ('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @band.delete
  @all_venues = Venue.all()
  erb(:index)
end
