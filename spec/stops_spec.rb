require 'spec_helper'

describe Stop do
  before do
    setup
  end

  it 'initializes a new stop' do
    expect(@test_stop).to be_an_instance_of Stop
  end

  it "returns the attributes of the current stop" do
    expect(@test_stop.line_id).to eq 1
    expect(@test_stop.station_id).to eq 1
  end

  it "saves a stop to the stops table" do
    @test_stop.save
    expect(Stop.all).to eq [@test_stop]
  end
end
