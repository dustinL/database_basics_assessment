class Train

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def save
    results = DB.exec("INSERT INTO trains (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    trains = []
    results = DB.exec("SELECT * FROM trains;")
      results.each do |result|
        attributes = {
          :name => result['name'],
          :id => result['id'].to_i
        }
        current_train = Train.new(attributes)
        trains << current_train
      end
    trains
  end

  def ==(another_train)
    self.name == another_train.name && self.id == another_train.id
  end

end
