class UsrInterface
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
    @type = []
  end

  def menu
    puts "1.Создать станцию"
    puts "2.Создать новый поезд"
    puts "3.Создание нового маршрутного листа"
    puts "4.Добавление станции к маршрутному листу"
    puts "5.Удаление станции в маршрутном листе"
    puts "6 Добавить вагон"
    puts "7.Выдать поезду маршрутный лист"
    puts "8.Добавить к поезду вагон"
    puts "9.Отцепить вагон от поезда"
    puts "10.Перемашение поезда вперед"
    puts "11.Перемашение поезда назад"
    puts "12.ПРосмотреть список станций"
    puts "13.Просмотреть список поездов на станции"
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
          new_wagon
        when '7'
          add_route_to_train
        when '8'
          add_wagon_to_train
        when '9'
          remove_wagon_from_train
        when '10'
          forward
        when '11'
          back
        when '12'
          show_stations
        when '13'
          trains_on_station_list
        when '0', 'exit'
          exit
        else
          puts "Некорректный ввод, попробуйте еще раз."
      end
    end
  end

  private

  def new_station
    puts "Введите название новой станции"
    name = gets.chomp.to_s
    @stations << Station.new(name)
    puts "Станция #{name} добавлена"
  end

  def new_train
    puts "Введите номер поезда"
    number = gets.chomp
    puts "Выберите тип поезда:"
    puts "1. Пассажирский"
    puts "2. Грузовой"
    type = gets.chomp.to_i
    if type == 1
      @trains << PasangerTrain.new(number)
      puts "Пассажирский поезд #{number} успешно добавлен!"
    elsif type == 2
      @trains << CargoTrain.new(number)
      puts "Грузовой поезд #{number} успешно добавлен!"
    else
      puts "Ошибка, повторите попытку ещё раз!"
      new_train
    end
  end

  def new_route
    if @stations.size < 2
      puts "Сначала добавте станции"
      new_station
    else
      puts "Выберите начальную станцию маршрута по индексу:"
      show_stations
      station_start = @stations[gets.to_i - 1]
      puts "Выберите конечную станцию маршрута по индексу: "
      show_stations
      station_finish = @stations[gets.to_i - 1]
      if station_finish != station_start
        route = Route.new(station_start, station_finish)
        @routes << route
        show_routes
      else
        "Станция в списке"
      end
    end
  end

  def add_station
    show_routes
    puts "Выберите номер маршрута"
    route = gets.chomp.to_i - 1
    show_stations
    puts "Выберите номер станции дл добавления"
    station = gets.chomp.to_i - 1
    @routes[route].add_stations(@stations[station])
  end

  def remove_station
    show_routes
    puts "Выберите номер маршрута"
    route = gets.chomp.to_i - 1
    show_stations
    puts "Выберите номер станции для удаления."
    station = gets.chomp.to_i - 1
    @routes[route].remove_station(@stations[station])
  end

  def add_route_to_train
    if @routes.empty?
      puts "Нет иаршрутов для добавления"
    else
      train = train_choice
      route = route_choice
      train.take_route(route)
    end
  end

  def new_wagon
    puts "Введите 1 для создания грузовой вагона"
    puts "Введите 2 для создания пассажирский вагона"
    wagon_choise = gets.to_i
    if wagon_choise == 1
      wagon = CargoWagon.new
      @wagons << wagon
      puts "В депо добавлен новый грузовой вагон"
    elsif wagon_choise == 2
      wagon = PasangerWagon.new
      @wagons << wagon
      puts "В депо добавлен новый пассажирский вагон"
    else
      puts "Ошибка ввода"
      return
    end
  end

  def add_wagon_to_train
      if @trains.empty?
        puts "Вагоны можно добавить к поезду. Для этого создайте поезд"
        return
      end
      if @wagons.empty?
        puts "В депо нет вагонов. Создайте новые или отцепите имеющиеся"
        return
      end
      puts "Список поездов:"
      show_trains
      puts "Введите индекс поезда для добавления вагонов"
      num = gets.to_i
      if num > 0 && num <= @trains.length
        current_train = @trains[num - 1]
        puts "Список вагонов в депо:"
        wagon_list
        puts "Выберете вагон по индексу:"
        choice = gets.to_i
        if  choice > 0 && choice <= @wagons.length
        wagon = @wagons[choice - 1]
         if current_train.class.to_s == "CargoTrain" && wagon.type.to_s == "Cargo"
           current_train.add_wagon(wagon)
           @wagons.slice!(choice - 1)
           puts "К поезду № #{current_train.number} прицеплен один грузовой вагон. #{current_train}"
         elsif current_train.class.to_s == "PasangerTrain" &&  wagon.type.to_s == "Pasanger"
           current_train.add_wagon(wagon)
           @wagons.slice!(choice - 1)
           puts "К поезду № #{current_train.number} прицеплен один пассажтрский вагон. #{current_train}"
         else
          puts "Этот вагон не подойдет"
          return
         end
        else
          puts "Ошибка"
          return
        end
      else
        puts "Ошибка"
        return
      end
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

  def trains_on_station
    print_all_trains
    end

  def show_trains
    @trains.each_with_index { |trains, index| puts "#{index + 1}) Поезд №#{trains.number} #{trains.type} "}
  end

  def wagon_list
    @wagons.each_with_index { |wagon, index| puts  "#{index + 1}) Вагон: #{wagon.type}" }
  end

  def show_stations
    @stations.each.with_index(1) {|station, index| puts "#{index}) - #{station.name}"}
  end

  def show_routes
    @routes.each.with_index(1) {|route, index| puts "#{index}) - #{route}"}
  end

  def train_choice
    puts "Выберите поезд по индексу:"
    show_trains
    train = @trains[gets.to_i - 1]
  end

  def route_choice
    puts "Выберите маршрут по индексу:"
    show_routes
    route = @routes[gets.to_i - 1]
  end

  def trains_on_station_list
    if @stations.empty?
      puts "Не создано станций"
      new_station
    else
      puts "Список станций:"
      show_stations
      puts "Выберете индекс станции для просмотра списка поездов на ней"
      num = gets.to_i
      if num > 0 && num <= @stations.length
        puts "На стации #{@stations[num - 1].name} находятся:"
        @stations[num - 1].trains_list
      else
        puts "Ошибка"
      end
    end
  end
end
