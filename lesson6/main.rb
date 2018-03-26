require_relative 'company_producer'
require_relative 'instance_counter'
require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'wagon'
require_relative 'pasanger_wagon'
require_relative 'cargo_wagon'
require_relative 'pasanger_train'
require_relative 'cargo_train'
require_relative 'usr_interface'

puts 'Пользовательский интерфейс'
usr_interface = UsrInterface.new
usr_interface.menu
usr_interface.control