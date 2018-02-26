class UsrInterface

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def menu
    puts "1.Создать станцию"
    puts "2.Создать новый поезд"
    puts "3.Создание нового маршрутного листа"
    puts "4.Добавление станции к маршрутному листу"
    puts "5.Удаление станции в маршрутном листе"
    puts "6.Выдать поезду маршрутный лист"
    puts "7.Добавить к поезду вагон"
    puts "8.Отцепить вагон от поезда"
    puts "9.Перемашение поезда вперед"
    puts "10.Перемашение поезда назад"
    puts "11.ПРосмотреть список станций"
    puts "12.Просмотреть список поездов на станции"
    puts "0.Выход"
  end

  def control
    loop do
      print "Выберите действие: "
      action = gets.chomp
      case action
        when '1'
          new_station
        when '2'
          new_train
        when '3'
          new_route
        when '4'
          add_station
        when '5'
          remove_station
        when '6'
          add_route_to_train
        when '7'
          add_wagon_to_train
        when '8'
          remove_wagon_from_train
        when '9'
          forward
        when '10'
          back
        when '11'
          show_stations
        when '12'
          list_of_trains
        when '0', 'exit'
          exit
        else
          puts 'Некорректный ввод, попробуйте еще раз.'
      end
    end
  end

  private

  def new_station
    puts 'Введите название новой станции'
    name = gets.chomp.to_s
    @stations << Station.new(name)
    puts "Станция #{name} добавлена"
  end

  def new_train
    puts 'Введите номер поезда'
    number = gets.chomp.to_i
    puts 'Выберите тип поезда:'
    puts '1. Пассажирский'
    puts '2. Грузовой'
    type = gets.chomp.to_i
    if type == 1
      @trains << PasangerTrain.new(number)
      puts "Пассажирский поезд #{number} успешно добавлен!"
    elsif type == 2
      @trains << CargoTrain.new(number)
      puts "Грузовой поезд #{number} успешно добавлен!"
    else
      puts 'Ошибка, повторите попытку ещё раз!'
      new_train
    end
  end

  def new_route
    puts 'Выберите начальную станцию маршрута по индексу:'
    show_stations
    station_start = @stations[gets.to_i - 1]
    print 'Выберите конечную станцию маршрута по индексу: '
    station_finish = @stations[gets.to_i - 1]
    route = Route.new(station_start, station_finish)
    @routes << route
    puts "Маршрут #{route.name} создан"
  end

  def add_station
    route = route_choice
    station = station_choise
    route.add_station(station)
    puts "Станция добавлена"
  end

  def remove_station
    route = route_choice
    station = station_choise
    route.remove_station(station)
    puts "Станция добавлена"
  end

  def add_route_to_train
    train = train_choice
    route = route_choice
    train.take_route(route)
  end

  def add_wagon_to_train
    train = train_choice
    if train.type == PasangerTrain
      train.add_wagon(PasangerWagon.new)
    else
      train.add_wagon(CargoWagon.new)
    end
    puts 'Вагон добавлен'
  end

  def remove_wagon_from_train
    train = train_choice
    train.remove_wagon(train.wagons.last)
    puts 'Вагон отцеплен'
  end

  def forward
    train = train_choice
    train.move_forward
    puts "Поезд пермещен вперед на станцию #{train.current_station.name}"
  end

  def back
    train = train_choice
    train.move_back
    puts "Поезд перемещен назад на станцию #{train.current_station.name}"
  end

  def list_of_trains
    station = station_choice
    station.trains.each {|train| puts "#{train.number} - #{train.class}"}
  end

  def show_trains
    @trains.each.with_index(1) {|train, index| puts "#{index} - #{train.number} - #{train.class}"}
  end

  def show_stations
    @stations.each.with_index(1) {|station, index| puts "#{index} - #{station.name}"}
  end

  def show_routes
    @routes.each.with_index(1) {|route, index| puts "#{index} - #{route.name}"}
  end

  def route_choice
    puts 'Выберите маршрут по индексу:'
    show_routes
    route = @routes[gets.to_i - 1]
  end

  def train_choice
    puts 'Выберите поезд по индексу:'
    show_trains
    train = @trains[gets.to_i - 1]
  end

  def station_choice
    puts 'Выберите станцию по индексу:'
    show_stations
    station = @stations[gets.to_i - 1]
  end
end


