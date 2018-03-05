class Route

  attr_reader :stations

  def initialize(station_start, station_finish)
    @stations = [station_start, station_finish]
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
end
