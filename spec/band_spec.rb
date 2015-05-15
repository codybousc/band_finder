require 'spec_helper'

describe(Band) do
  it("plays at specific venues") do
    new_band = Band.create({:name => "Manu"})
    new_venue = Venue.create({:name => "The New Parish"})
    new_venue.bands.push(new_band)
    expect(new_venue.bands).to(eq([new_band]))
  end

  it("validates presence of name") do
    new_band = Band.new({:name => ""})
    expect(new_band.save()).to(eq(false))
  end
end
