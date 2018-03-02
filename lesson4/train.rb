class Train
  attr_reader :speed, :wagons

  def initialize(number)
    @speed = 0
    @number = number
    @wagons = []
  end

  def up_speed(value)
    @speed += value
  end

  def down_speed(value)
    if value > @speed
      puts "no"
    else
      @speed -= value
    end
  end

  def stop
    @speed = 0
  end

  def moving?
    @speed > 0
  end

  def add_wagon(wagon)
    @wagons << wagon if @speed == 0 && type == wagon.type
  end

  def remove_wagon(wagon)
    @wagons.delete(wagon) unless [@wagons[0], @wagons[-1]].include? wagon
  end

  def take_route(route)
    @route = route
    @current_station_index = 0
    current_station.add_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    @route.stations[@current_station_index - 1] if @current_station_index > 0
  end

  def move_forward
    unless next_station.nil?
      current_station.departure_train(self)
      next_station.add_train(self)
      @current_station_index += 1
    end
  end

  def move_back
    unless previous_station.nil?
      current_station.departure_train(self)
      previous_station.add_train(self)
      @current_station_index -= 1
    end
  end

  def next_station
    @route.stations[@current_station_index + 1] if @route.stations.size > @current_station_index + 1
  end
end
