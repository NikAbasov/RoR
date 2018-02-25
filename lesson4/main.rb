require_relative 'route'
require_relative 'train'
require_relative 'station'


=begin
# Создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
- Создавать станции
- Создавать поезда
- Создавать маршруты и управлять станциями в нем (добавлять, удалять)
- Назначать маршрут поезду
- Добавлять вагоны к поезду
- Отцеплять вагоны от поезда
- Перемещать поезд по маршруту вперед и назад
- Просматривать список станций и список поездов на станции

В качестве ответа приложить ссылку на репозиторий с решением
=end


class Railway
  def menu
    puts "1.Создать станцию"
    puts "2.Создать новый поезд"
    puts "3.Создание нового маршрутного листа"
    puts "4.Добавление станции к маршрутному листу"
    puts "5.Удаление станции в маршрутном листе"
    puts "6.Выдать поезду маршрутный лист"
    puts "7.Добавить к поезду вагон"
    puts "8.Отцепить вагон от поезда"
    puts "9.Перемашение поезда вперед или назад"
    puts "11.ПРосмотреть список станций"
    puts "12.Просмотреть список поездов на станции"
    puts "0.Выход"
  end

  loop do
    choice = gets.chomp.to_i
    if choice == 1
      new_station
    elsif choice == 2
      new_train
    elsif choice == 3
      new_route
    elsif choice == 4
      edit_route
    elsif choice == 5
      set_path
    elsif choice == 6
      new_carriage
    elsif choice == 7
      add_carriage
    elsif choice == 8
      delete_carriage
    elsif choice == 9
      move_train
    elsif choice == 10
      list_of_stations
    elsif choice == 11
      list_of_trains_on_station
    elsif choice == 12
      exit
    elsif choice == 0
      menu
    else
      puts 'Ошибка! Повторите ввод.'
    end
    puts 'Для выхода нажмите наберите 12, для вывода МЕНЮ - 0'
  end
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
      @trains << PassengerTrain.new(number)
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
    puts "Введите название станции"
  end
end


