require 'spec_helper'

describe Station do
  before do
    setup
  end

  it "intializes a new station" do
    expect(@test_station).to be_an_instance_of Station
  end

  it "returns the attributes of the current station" do
    expect(@test_station.name).to eq "Park Place"
  end

  it "saves a station to the stations table" do
    @test_station.save
    expect(Station.all).to eq [@test_station]
  end
end
