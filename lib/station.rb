class Station

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM stations;")
      results.each do |result|
      attributes = {
        :name => result['name'],
        :id => result['id'].to_i
      }
      current_station = Station.new(attributes)
      stations << current_station
    end
    stations
  end

  def ==(another_station)
    self.name == another_station.name && self.id == another_station.id
  end

end
