class Stop

  attr_reader :id, :line_id, :station_id

  def initialize(attributes)
    @id = attributes[:id].to_i
    @line_id = attributes[:line_id].to_i
    @station_id = attributes[:station_id].to_i
  end

end
