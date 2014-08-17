require 'pg'
require 'train'
require 'stops'
require 'station'

DB = PG.connect({:dbname => "train_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("ALTER SEQUENCE trains_id_seq RESTART WITH 1;")
    DB.exec("DELETE FROM stops *;")
    DB.exec("ALTER SEQUENCE stops_id_seq RESTART WITH 1;")
    DB.exec("DELETE FROM stations *;")
    DB.exec("ALTER SEQUENCE stations_id_seq RESTART WITH 1;")
  end
end

def setup
  @test_train = Train.new({:name => "Blue"})
  @test_station = Station.new({:name => "Park Place"})
  # @test_stop = Stop.new({:line_id => 1, :station_id => 3})
end
