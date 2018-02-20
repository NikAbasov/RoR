class Train
  WAGON_ACTION = [:up, :down]
  attr_accessor :speed, :number, :type, :wagon
  

  def initialize(speed, number, wagons, type)
    @speed = speed
    @number = number
    @wagons = wagons
    @type = type
  end
  
  
  def up_speed(value)
  @speed += value
  puts "Внимание, скорость повышаеться на #{value}, и равна #{speed}"
  end

  def down_speed(value)
   speed -= value
   puts "Внимание, скорость понижаеться на #{value}, и равна #{speed}"
  end
  
  def stop
   speed = 0
  end
  
  def curent_speed
   puts @speed
  end
  
  def add_wagon(wagon)
    if @speed.zero?
      @wagons += 1 if @wagons > 0
      else
      puts "Сначала Остановите поезд"
      end
  end
  
  def delete_wagon(wagon)
    if @speed.zero?
      @wagons -= 1 if @wagons > 0
      else
      puts "Сначала Остановите поезд"
      end
  end
  		
  def wagons_list
   puts "Колличество вагонов в поезде = #{wagons}"
  end
  
def add_route(route)
    @route = route
    @station_index = 0
    current_station.receive_train(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1] if @station_index != @route.stations.size - 1
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index != 0
  end

  def go_next_station
    if next_station != @route.stations.last
      current_station.send_train(self)
      @station_index += 1
      current_station.receive_train(self)
    else
      current_station
    end
  end

  def go_previous_station
    if next_station != @route.stations.last
      current_station.send_train(self)
      @station_index -= 1
      current_station.receive_train(self)
    else
      current_station
    end
  end

end
