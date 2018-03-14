class Train

  attr_reader :speed, :wagons, :number, :type

  def initialize(number, type)
    @speed = 0
    @number = number
    @type = type
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
    @wagons << wagon if @speed == 0 && @type == wagon.type
  end

  def remove_wagon_from_train
    if @trains.empty?
      puts "Нет поездов - нет вагонов."
      return
    end
    puts "Список поездов:"
    show_trains
    puts "Введите индекс поезда для отцепления вагонов"
    num = gets.to_i
    if num > 0 && num <= @trains.length
      current_train = @trains[num - 1]
      if current_train.wagons.size > 0
        puts "Выберете вагон для отцепления:"
        current_train.wagons.each_with_index{|wagon,index| puts "#{index + 1}) #{wagon.type}" }
        wagon_choice = gets.to_i
        if wagon_choice > 0 && wagon_choice <= current_train.wagons.length
          @wagons << current_train.wagons[wagon_choice - 1]
          current_train.wagons.slice!(wagon_choice-1)
          puts "От поезда #{current_train.number} отцеплен один вагон."
        else
          puts "Ошибка"
        end
      else
        puts "Ошибка"
      end
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
end
