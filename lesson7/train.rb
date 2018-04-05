class Train
  include CompanyProducer
  include InstanceCounter

  attr_reader :speed, :wagons, :number, :type

  NUMBER_FORMAT = /^[a-z\d]{3}-?[a-z\d]{2}$/i

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @speed = 0
    @number = number
    validate!
    @type = type
    @wagons = []
    register_instanse
    @@trains[number] = self
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

  def add_wagon(wagon)
    @wagons << wagon if @speed == 0 && @type == wagon.type
  end

  def remove_wagon(wagon)
    if speed.zero?
      @wagons.delete(wagon)
    else
      puts "остановите поезд"
    end
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

  protected

  def validate!
    raise "Номер поезда не может быть пустым" if number.nil?
    raise "Номер не может быть меньше 5 символов" if number.length < 5
    raise "Не коректно создан номер поезда,номер должен выглядеть как на примере(ab2-x3)" if number !~ NUMBER_FORMAT
    true
  end
end
