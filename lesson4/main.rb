require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'pasanger_wagon'
require_relative 'cargo_wagon'
require_relative 'pasanger_train'
require_relative 'cargo_train'
require_relative 'usrinterface'

puts 'Пользовательский интерфейс'
UsrInterface = UsrInterface.new
UsrInterface.menu
UsrInterface.control