require 'spec_helper'

describe Train do
  before do
    setup
  end

  it 'intializes a new train line' do
    expect(@test_train).to be_an_instance_of Train
  end

  it "returns the attributes of the current train" do
    expect(@test_train.name).to eq "Blue"
  end

  it "saves a train to the trains table" do
    @test_train.save
    expect(Train.all).to eq [@test_train]
  end
end

