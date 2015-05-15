require 'spec_helper'

describe(Venue) do
  it("hosts many bands") do
    new_venue = Venue.create({:name => "The New Parish"})
    new_band = Band.create({:name => "Manu"})
    new_band.venues.push(new_venue)
    expect(new_band.venues()).to(eq([new_venue]))
  end
  it("validates presence of name") do
    new_venue = Venue.new({:name => ""})
    expect(new_venue.save()).to(eq(false))
  end
end
