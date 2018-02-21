class Train
  attr_reader :speed, :wagons, :current_station_index

  def initialize(number,type, wagons)
    @speed = 0
    @number = number
    @wagons = wagons
    @type = type
    @route = []
  end
  
  def up_speed(value)
   @speed += value
  end

  def stop
   @speed = 0
  end
  
  def moving?
    @speed > 0
  end

  def curent_speed
   puts @speed
  end
  
   def add_vagon
    raise "Сначала остановите поезд" if moving?
    @wagons += 1
  end

  def remove_vagon
    raise "Сначала остановите поезд" if moving?
    @wagons -= 1 if wagons > 0
  end
  		
  def wagons_list
   puts @wagons
  end
  
  def accept_route(route)
   clear_route

    route = route
    route.stations[0].add_train
    current_station_index = 0
  end

  def current_station
  route.stations[current_station_index]
  end

  def print_next_station
    if self.current_station == self.route.last
     puts "Это последняя станция"
    else
     next_station = self.route[self.route.index(self.current_station) + 1]
     puts "Следущая станция #{next_station}"
    end
  end

  def print_prev_station
    if self.current_station == self.route.first
      puts "Это первая станция"
    else
      prev_station = self.route[self.route.index(self.current_station) - 1]
      puts "Предыдущая станция #{prev_station}"
    end
  end

  def go_next_station
    self.current_station = self.route[self.route.index(self.current_station) + 1]
    puts "Поезд приехал на станцию #{self.current_station}"
    puts "Это конечная станция, можно ехать обратно" if self.current_station == self.route.last
  end

  def go_prev_station
    if self.current_station == self.route.first
      puts "Это первая станция, можно ехать только вперед"
    elsif 
      self.current_station != self.route.last
      puts "Это еще не конечная станция, едем вперед" 
    else 
      self.current_station == self.route[self.route.index(self.current_station) - 1]
      puts "Поезд приехал на станцию #{self.current_station}"
    end
  end

end
