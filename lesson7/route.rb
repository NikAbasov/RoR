class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(station_start, station_finish)
    @stations = [station_start, station_finish]
    validate!
    register_instanse
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_stations(station)
    @stations << station

  end

  def remove_station(station)
    stations.delete(station) unless [stations[0], stations[-1]].include? station
  end

  def show_stations
    puts @stations
  end

  def validate!
    raise "Начальная или конечная станция не существует" if @stations.any?(&:nil?)
    raise "Для создания маршрута нужны станции" if @stations.any? {|station| !station.instance_of? Station}
    raise "В маршруте должны быть разные начальная и конечная станции" if @stations.first == @stations.last
    true
  end
end
