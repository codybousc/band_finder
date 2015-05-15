require 'spec_helper'

describe(Band) do
  it("plays at specific venues") do
    new_band = Band.create({:name => "Manu"})
    new_venue = Venue.create({:name => "The New Parish"})
    new_venue.bands.push(new_band)
    expect(new_venue.bands).to(eq([new_band]))
  end
end
