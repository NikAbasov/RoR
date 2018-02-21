class Train
  attr_accessor :speed, :number, :type, :wagon, :current_station, :route        
  

  def initialize(number,type, wagons)
    @speed = 0
    @number = number
    @wagons = wagons
    @type = type
    @route = []
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
   @speed = 0
  end
  
  def curent_speed
   puts @speed
  end
  
  def add_wagon(wagons)
    if @speed.zero?
      @wagons += 1 if @wagons > 0
      else
      puts "Сначала Остановите поезд"
      end
  end
  
  def delete_wagon(wagons)
    if @speed.zero?
      @wagons -= 1 if @wagons > 0
      else
      puts "Сначала Остановите поезд"
      end
  end
  		
  def wagons_list
   puts "Колличество вагонов в поезде = #{wagons}"
  end
  
  def accept_route(route)
   @route = route.route
   self.current_station = self.route.first
   puts "Поезд находится на станции #{current_station} и поедет по марщруту #{self.route.first} - #{self.route.last}"
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

